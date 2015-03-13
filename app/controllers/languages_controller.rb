class LanguagesController < ApplicationController
  before_action :set_language, only: [:show]

  # GET /languages
  # GET /languages.json
  def index
    @languages = Language.all
  end

  # GET /languages/1
  # GET /languages/1.json
  def show
    @language = Language.find(params[:id])
  end
end
