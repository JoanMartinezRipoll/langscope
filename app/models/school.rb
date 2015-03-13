class School < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :language_offers
  has_many :languages, through: :language_offers
  belongs_to :country
  accepts_nested_attributes_for :language_offers, allow_destroy: true
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  validates :name, length: { maximum: 50}
  validates :address, length: { maximum: 100}
  validates :plz, length: { maximum: 10}
end
