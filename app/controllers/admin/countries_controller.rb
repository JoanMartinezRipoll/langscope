class Admin::CountriesController < ApplicationController
  before_action :is_admin
  before_action :set_country, only: [:edit, :update, :destroy]

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

  # GET /countries/new
  def new
    @country = Country.new
  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to [:admin, @country], notice: 'Country was successfully created.' }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to [:admin, @country], notice: 'Country was successfully updated.' }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to admin_countries_url, notice: 'Country was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_country
    #see https://hackhands.com/ruby-rails-performance-tuning/
    @country = Country.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def country_params
    params.require(:country).permit(:name, :population, :code)
  end
end
