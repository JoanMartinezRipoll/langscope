class PercentagesController < ApplicationController

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
    if @percentage.save
      params[:percentage][:language_ids].each {|language_id|
        PercentLanguage.create(percentage_id: @percentage.id, language_id: language_id) unless language_id.empty?
      }
      flash[:info] = "Percentage saved"
      redirect_to root_url
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
