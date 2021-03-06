class ProductsController < ApplicationController
  
  def index
    @products = current_user.products.all
  end


  def new
    @product  = current_user.products.new
  end


  def show
    product_find
    
  end
  


  def create
    @product  = current_user.products.new(product_params)
    if @product.save
      flash[:success] = "Product successfully created"
      redirect_to products_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  
  end
  
  def show
    product_find
  end


  def edit
    product_find

  end


  def update
    product_find
    if @product.update(product_params)
        flash[:success] = "Product was successfully updated"
        redirect_to products_path
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    product_find 
    @product.destroy
    if @product.destroy
      flash[:success] = 'Product was successfully deleted.'
      redirect_to products_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to products_path
    end
  end
  
  

  private 
  def product_find 
    @product = current_user.products.find(params[:id])
  end
  def product_params 
    params.require(:product).permit(:name, :color, :price, :image, suggestions_attributes: [:suggestionable_type, :suggestions] )
  end
end
