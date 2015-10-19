class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :flats, foreign_key: "owner_id", depedent: :destroy
  has_many :bookings, foreign_key: "guest_id",  depedent: :destroy

end
