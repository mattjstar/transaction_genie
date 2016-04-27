namespace :parse do
  desc "This task uploads scrapped acris transactions for Parcels and Documents"
  task :acris_jsons do
    my_hash = JSON.parse(File.read('example.json'))

    my_hash.each do |hash|
      parcels = hash[1]["parcels"]
      parcels.each do |parcel|
        borough = borough_int_from_name(parcel['borough'])
        block = parcel['block'].rjust(5, '0')
        lot = parcel['lot'].rjust(4, '0')
        bbl = "#{borough}#{block}#{lot}"

        partial = parcel['partial']
        property_type = parcel['property_type']
        property_address = parcel['property_address']
        unit = parcel['unit']
        remarks = parcel['remarks']

        easement = string_to_boolean(parcel['easement'])
        air_rights = string_to_boolean(parcel['air_rights'])
        subterranean_rights = string_to_boolean(parcel['subterranean_rights'])


        puts "_______________________________"
        puts "BECOMES: #{bbl}"
      end
    end
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

# def parcel_params
#   "borough",
#   "block",
#   "lot",
#   "bbl",
#   "partial",
#   "property_type",
#   "easement",
#   "air_rights",
#   "subterranean_rights",
#   "property_address",
#   "unit",
#   "remarks",
# end