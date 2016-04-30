namespace :parse do
  desc "This task uploads scrapped acris transactions for Parcels and Documents"
  task acris_jsons: :environment do
    my_hash = JSON.parse(File.read('example.json'))

    my_hash.each do |hash|
      puts "_______________________________"

      data = hash[1]
      document_params = {}
      document_params['document_id_num'] = data['document_id']
      document_params['crfn'] = data['crfn']
      document_params['collateral'] = data['collateral']
      document_params['num_pages'] = data['num_pages'].to_i
      document_params['reel_page'] = data['reel_page']
      document_params['doc_type'] = data['doc_type']
      document_params['file_num'] = data['file_num']
      document_params['slid_num'] = data['slid_num']
      document_params['rptt_num'] = data['rptt_num']
      document_params['map_sequence_num'] = data['map_sequence']
      document_params['message'] = data['message']
      document_params['remarks'] = data['remarks']

      document_params['expiration_date'] = string_to_date(data['expiration_date'])
      document_params['assessment_date'] = string_to_date(data['assessment_date'])
      document_params['doc_date'] = string_to_date(data['doc_date'])
      document_params['recorded_filed_at'] = string_to_date_time(data['recorded_filed'])

      document_params['doc_amount'] = string_to_price(data['doc_amount'])
      document_params['borough'] = borough_int_from_name(data['borough'])
      document_params['percent_transferred'] = string_to_percent(data['percent_transferred'])

      puts "Creating DOCUMENT from: #{document_params}"

      doc = Document.find_by document_id_num: document_params['document_id_num']

      if doc
        doc.update_attributes(document_params.except('document_id_num'))
        puts "-----DOCUMENT ALREADY EXISTS-----"
        puts "DOCUMENT updated: #{doc.id}"
      else
        doc = Document.create(document_params)
        puts "DOCUMENT created: #{doc.id}"
      end

      parcels = data["parcels"]
      parcels.each do |parcel|
        parcel_params = {}
        borough = borough_int_from_name(parcel['borough'])
        block = parcel['block'].rjust(5, '0').to_i
        lot = parcel['lot'].rjust(4, '0').to_i

        parcel_params['bbl'] = "#{borough}#{block}#{lot}"

        parcel_params['borough'] = borough
        parcel_params['block'] = block
        parcel_params['lot'] = lot
        parcel_params['partial'] = parcel['partial']
        parcel_params['property_type'] = parcel['property_type']
        parcel_params['property_address'] = parcel['property_address']
        parcel_params['unit'] = parcel['unit']
        parcel_params['remarks'] = parcel['remarks']

        parcel_params['easement'] = string_to_boolean(parcel['easement'])
        parcel_params['air_rights'] = string_to_boolean(parcel['air_rights'])
        parcel_params['subterranean_rights'] = string_to_boolean(parcel['subterranean_rights'])

        puts "Find or Creating PARCEL from: #{parcel_params}"
        parcel = Parcel.create_with(parcel_params.except('bbl')).find_or_create_by(bbl: parcel_params['bbl'])
        
        if parcel
          puts "Adding PARCEL: #{parcel.id} to DOCUMENT: #{doc.id}"
          doc.parcels << parcel
        else
          puts "Failed to add PARCEL to DOCUMENT: #{doc.id}"
        end
      end

      party_1 = data["party_1"]
      party_1.each do |party|
        party_params = build_party_params(party)
        puts "Find or Creating PARTY 1 from: #{party_params}"
        persist_party_to_document(party_params, doc, 1)
      end

      party_2 = data["party_2"]
      party_2.each do |party|
        party_params = build_party_params(party)
        puts "Find or Creating PARTY 2 from: #{party_params}"
        persist_party_to_document(party_params, doc, 2)
      end

      party_3 = data["party_3"]
      party_3.each do |party|
        party_params = build_party_params(party)
        puts "Find or Creating PARTY 3 from: #{party_params}"
        persist_party_to_document(party_params, doc, 3)
      end

      references = data["references"]
      references.each do |reference|
        reference_params = {}
        reference_params["crfn"] = reference["crfn"]
        reference_params["document_id_num"] = reference["document_id"]
        reference_params["borough"] = borough_int_from_name(reference["borough"])
        reference_params["year"] = reference["year"]
        reference_params["reel"] = reference["reel"]
        reference_params["page"] = reference["page"]
        reference_params["file_num"] = reference["file_nbr"]
        puts "Creating REFERENCE from: #{reference_params}"

        puts "Find or Creating REFERENCE from: #{reference_params}"
        create_params = reference_params.except(['crfn', 'document_id_num'])
        reference = Reference.create_with(create_params).find_or_create_by(
          crfn: reference_params['crfn'], 
          document_id_num: reference_params['document_id_num']
        )
        
        if reference
          puts "Adding REFERENCE: #{reference.id} to DOCUMENT: #{doc.id}"
          doc.references << reference
        else
          puts "Failed to add REFERENCE to DOCUMENT: #{doc.id}"
        end
      end
    end
  end
end

def build_party_params(party)
  party_params = {}
  party_params['name'] = party['name']
  party_params['line1'] = party['address_1']
  party_params['line2'] = party['address_2']
  party_params['city'] = party['city']
  party_params['state'] = party['state']
  party_params['zip'] = party['zip']
  party_params['country'] = party['country']
  return party_params
end

def persist_party_to_document(party_params, document, party_level)
  create_params = party_params.except(['name'])
  party = Party.create_with(create_params).find_or_create_by(
    name: party_params['name']
  )

  if party
    puts "Adding PARTY: #{party.id} to DOCUMENT: #{document.id}"
    document.parties << party
    dp = DocumentsParty.update_level(document.id, party.id, party_level)
    puts "Updated DocumentsParty: #{dp.id} with party_level: #{dp.party_level}"
  else
    puts "Failed to add PARTY to DOCUMENT: #{document.id}"
  end
end

def string_to_percent(string)
  # Example: "100%"
  return nil unless string =~ /\d/
  string.gsub("%", "").to_d * 0.01
end

def string_to_price(string)
  # Example: "$850,000.00"
  return nil unless string =~ /\d/
  string.gsub("$", "").to_d
end

def string_to_date_time(string)
  # Example: "2/28/2014 5:03:22 PM"
  return nil unless string =~ /\d/
  DateTime.strptime(string, '%m/%e/%Y %I:%M:%S %p')
end

def string_to_date(string)
  # Example: "9/27/2013"
  return nil unless string =~ /\d/
  DateTime.strptime(string, '%m/%e/%Y').to_date
end

def string_to_boolean(string)
  string == 'Y' ? true : false
end

def borough_int_from_name(name)
  case name
  when 'MANHATTAN'
    1
  when 'MANHATTAN / NEW YORK'
    1
  when 'BRONX'
    2
  when 'BROOKLYN / KINGS'
    3
  when 'QUEENS'
    4
  when 'STATEN ISLAND'
    5
  else
    nil
  end
end