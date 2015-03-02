class Percentage < ActiveRecord::Base
  belongs_to :country
  has_many :percent_languages
  has_many :languages, :through => :percent_languages

  validates :country, presence: true
  validates :percent, presence: true, :numericality => {:greater_than => 0, :less_than => 100}
  #validate :has_project_disciplines

   # def languages
   # 	language_ids = "SELECT language_id FROM percent_languages WHERE percentage_id = :percentage_id"
   #  languages = Language.where("id IN (#{language_ids})",percentage_id: id).pluck("name")
   # end 
end