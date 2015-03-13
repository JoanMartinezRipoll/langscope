class Admin::PercentagesController < ApplicationController
  before_action :is_admin
  before_action :authenticate_school! && current_school.admin?
  def index
    #@users = User.paginate(page: params[:page])
    @percentages = Percentage.all
  end

  def new
    @percentage = Percentage.new
    @countries = Country.all
  end

  def show
    @percentage = Percentage.find(params[:id])
  end

  def create
    @percentage = Percentage.new(percentage_params)
    #Using the association name with a through automatically fills the join model table
    @percentage.language_ids = params[:percentage][:language_ids]
    if @percentage.save
      flash[:info] = "Percentage saved"
      redirect_to percentages_url
    else
      render 'new'
    end
  end

  def edit
    @percentage = Percentage.find(params[:id])
  end

  def update
    @percentage = Percentage.find(params[:id])
    if @percentage.update_attributes(percentage_params)
      flash[:success] = "Percentage updated"
      redirect_to @percentage
    else
      render 'edit'
    end
  end

  def destroy
    Percentage.find(params[:id]).destroy
    flash[:success] = "Percentage deleted"
    redirect_to percentage_url
  end
  private

  def percentage_params
    # we want to require the params hash to have a :user attribute,
    #and we want to permit the name, email, password, and password confirmation attributes (but no others).
    params.require(:percentage).permit(:country_id, :percent, :language_ids)
  end
end
