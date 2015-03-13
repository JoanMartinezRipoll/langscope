class CountriesController < ApplicationController
  # GET /countries
  # GET /countries.json
  def index
    #The view for a country will list each of the spoken languages of that country
    @countries = Country.includes( percentages: :languages).all
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
    #see https://hackhands.com/ruby-rails-performance-tuning/
    @country = Country.includes( percentages: :languages).find(params[:id])
  end
end
