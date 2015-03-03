class ScopeController < ApplicationController


  #GET /scope
  #GET /scope.json
  def myscope
	#When a user selects some languages,all the countries where these are spoken will be listed
    languages = Language.includes( percentages: :country).find(params[:scope][:language_ids].drop(1)) #first element is always blank
    @scope, @world_ratio = Language.getScopeOf(languages)
  end

end
