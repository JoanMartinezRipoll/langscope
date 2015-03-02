class Language < ActiveRecord::Base
  has_many :percent_language
  has_many :percentage, :through => :percent_language
end
