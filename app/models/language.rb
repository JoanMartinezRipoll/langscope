class Language < ActiveRecord::Base
  has_many :percent_languages
  has_many :percentages, :through => :percent_languages
end
