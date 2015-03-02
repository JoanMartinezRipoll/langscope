class PercentLanguage < ActiveRecord::Base
	belongs_to :percentage 
	belongs_to :language
end
