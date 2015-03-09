class LanguageOffer < ActiveRecord::Base
  belongs_to :school
  belongs_to :language
end
