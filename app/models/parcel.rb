class Parcel < ActiveRecord::Base
  validates_presence_of :borough, :block, :lot
end
