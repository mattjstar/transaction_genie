namespace :parse do
  desc "This task uploads scrapped acris transactions for Parcels and Documents"
  task :acris_jsons do
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

      puts "DOCUMENT PARAMS: #{document_params}"

      parcels = data["parcels"]
      parcels.each do |parcel|
        parcel_params = {}
        borough = borough_int_from_name(parcel['borough'])
        block = parcel['block'].rjust(5, '0').to_i
        lot = parcel['lot'].rjust(4, '0').to_i

        parcel_params['bbl'] = "#{borough}#{block}#{lot}".to_i

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

        puts "PARCEL PARAMS: #{parcel_params}"
      end

      party_1 = data["party_1"]
      party_1.each do |party|
        party_params = build_party_params(party)
        puts "PARTY 1 PARAMS: #{party_params}"
      end

      party_2 = data["party_2"]
      party_2.each do |party|
        party_params = build_party_params(party)
        puts "PARTY 2 PARAMS: #{party_params}"
      end

      party_3 = data["party_3"]
      party_3.each do |party|
        party_params = build_party_params(party)
        puts "PARTY 3 PARAMS: #{party_params}"
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

def string_to_percent(string)
  # Example: "100%"
  string.gsub("%", "").to_d * 0.01
end

def string_to_price(string)
  # Example: "$850,000.00"
  string.gsub("$", "").to_d
end

def string_to_date_time(string)
  # Example: "2/28/2014 5:03:22 PM"
  DateTime.strptime(string, '%m/%e/%Y %I:%M:%S %p')
end

def string_to_date(string)
  # Example: "9/27/2013"
  if string == 'N/A'
    return nil
  else
    return DateTime.strptime(string, '%m/%e/%Y').to_date
  end
end

def string_to_boolean(string)
  string == 'Y' ? true : false
end

def borough_int_from_name(name)
  case name
  when 'MANHATTAN'
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