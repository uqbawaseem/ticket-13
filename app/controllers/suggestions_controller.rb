class SuggestionsController < ApplicationController
  def index
    @suggestions = current_user.suggestions.all
  end


  def new
    @suggestion  = current_user.suggestions.new
  end


  def show
    suggestion_find
    
  end
  


  def create
    @suggestion  = current_user.suggestions.new(suggestion_params)
    if @suggestion.save
      flash[:success] = "suggestion successfully created"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  
  end
  
  def show
    suggestion_find
  end


  def edit
    suggestion_find

  end


  def update
    suggestion_find
    if @suggestion.update(suggestion_params)
        flash[:success] = "suggestion was successfully updated"
        redirect_to suggestions_path
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    suggestion_find 
    @suggestion.destroy
    if @suggestion.destroy
      flash[:success] = 'suggestion was successfully deleted.'
      redirect_to products_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to products_path
    end
  end
  
  

  private 
  def suggestion_find 
    @suggestion = current_user.suggestions.find(params[:id])
  end
  def suggestion_params 
    params.require(:suggestion).permit(:suggestionable_id, :suggestionable_type, :suggestion)
  end
end
