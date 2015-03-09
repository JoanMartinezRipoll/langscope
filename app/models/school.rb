class School < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :language_offers
  has_many :languages, :through => :language_offers
  accepts_nested_attributes_for :language_offers, allow_destroy: true
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, length: { maximum: 50}
  validates :address, presence: true, length: { maximum: 100}
  validates :plz, presence: true
end
