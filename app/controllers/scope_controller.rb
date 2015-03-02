class ScopeController < ApplicationController
  

  #GET /scope
  #GET /scope.json
  def myscope
  	language_ids = params[:scope][:language_ids].drop(1) #first element is always blank
  	languages = Language.find(language_ids)
  end
end
