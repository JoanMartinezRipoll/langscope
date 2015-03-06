class School < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, length: { maximum: 50}
  validates :address, presence: true, length: { maximum: 100}
  validates :plz, presence: true
end
