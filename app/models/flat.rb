class Flat < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :bookings, dependent: :destroy

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  geocoded_by :full_street_address
  after_validation :geocode, if: :full_address_changed?


  def full_street_address
   "#{street}, #{zip_code} #{city}"
  end

  def full_address_changed?
  street_changed? || city_changed? || zip_code_changed?
  end

end

