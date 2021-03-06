class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :remove]
  before_action :authorized?


  # GET /products
  # GET /products.json
  def index
    #@products = Product.all
    redirect_to root_path
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @product.build_price
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)


    respond_to do |format|
      if @product.save
        format.html { redirect_to seller_path(current_seller), notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|

      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  def remove
    @product.update_attributes({published: false})

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :description, :company, :count,
                                    :published, :picture, :tag_list, :seller_id, :price_attributes => [:amount, :currency],
                                    :color_ids => [], :size_ids => [], :tag_ids => [])
  end

  def authorized?
    unless current_seller
      redirect_to root_url
    end
  end
end
