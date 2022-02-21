class Users::SuggestionsController < SuggestionsController
  before_action :set_suggestionable 
  
  private

  def set_suggestionable
    @suggestionable = current_user.find(params[:id])
  end
end
