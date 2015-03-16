class Country < ActiveRecord::Base
  has_many :percentages
  validates :name, presence: true
end
