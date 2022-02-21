class Products::SuggestionsController < SuggestionsController
  before_action :set_suggestionable 
  
  private

  def set_suggestionable
    @suggestionable = Product.find(params[:id])
  end
end
