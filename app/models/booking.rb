class Booking < ActiveRecord::Base
  belongs_to :flat
  belongs_to :guest, class_name: "User", foreign_key: "guest_id"
end
