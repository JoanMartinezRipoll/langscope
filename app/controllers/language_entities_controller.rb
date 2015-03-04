class LanguageEntitiesController < ApplicationController
  before_action :set_language_entity, only: [:show, :edit, :update, :destroy]

  # GET /language_entities
  # GET /language_entities.json
  def index
    @language_entities = LanguageEntity.all
  end

  # GET /language_entities/1
  # GET /language_entities/1.json
  def show
  end

  # GET /language_entities/new
  def new
    @language_entity = LanguageEntity.new
  end

  # GET /language_entities/1/edit
  def edit
  end

  # POST /language_entities
  # POST /language_entities.json
  def create
    @language_entity = LanguageEntity.new(language_entity_params)

    respond_to do |format|
      if @language_entity.save
        format.html { redirect_to @language_entity, notice: 'Language entity was successfully created.' }
        format.json { render :show, status: :created, location: @language_entity }
      else
        format.html { render :new }
        format.json { render json: @language_entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /language_entities/1
  # PATCH/PUT /language_entities/1.json
  def update
    respond_to do |format|
      if @language_entity.update(language_entity_params)
        format.html { redirect_to @language_entity, notice: 'Language entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @language_entity }
      else
        format.html { render :edit }
        format.json { render json: @language_entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /language_entities/1
  # DELETE /language_entities/1.json
  def destroy
    @language_entity.destroy
    respond_to do |format|
      format.html { redirect_to language_entities_url, notice: 'Language entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_language_entity
      @language_entity = LanguageEntity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def language_entity_params
      params.require(:language_entity).permit(:name, :street, :plz, :email, :country_id)
    end
end
