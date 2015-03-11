class SchoolsController < ApplicationController
  before_action :authenticate_school! , only: [:edit, :update]
  def index
    @schools = School.all
  end

  def show
  end

  # def edit
  # end

  # def update
  #   if current_school.update_attributes(school_params)
  #     flash[:success] = "Profile updated"
  #     redirect_to current_school
  #   else
  #     render 'edit'
  #   end
  # end

  # private
  # def school_params
  #   params.require(:school).permit(:name, :address, :plz, :country_id,
  #                                  language_offers_attributes: [:_destroy, :school_id, :language_id, :price, :level, :id])
  # end
end
