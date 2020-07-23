class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit]

  # GET /products
  # GET /products.json
  def index
    if params[:category_id]
      @products = Product.where(category_id: params[:category_id]).includes(:category)
    else
      @products = Product.all.includes(:category)
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.create!(product_params)
    manager = ProductImageManager.create!(
      product_id: @product.id,
      order: @product.images.map(&:id),
      thumbnail_id: @product.images.first&.id,
      alt_thumbnail_id: @product.images.second&.id,
    )
    @product.update!(image_manager_id: manager.id)
    redirect_to @product, notice: 'Product was successfully created.'
  rescue ActiveRecord::RecordInvalid => invalid
    set_categories
    flash.now[:warning] = 'Product failed to create. Ensure that data is valid.'
    render :new
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product.update!(product_params)
    @product.image_manager.update!(
      order: @product.images.map(&:id),
      thumbnail_id: @product.images.first&.id,
      alt_thumbnail_id: @product.images.second&.id,
    )
    redirect_to @product, notice: 'Product was successfully updated.'
  rescue ActiveRecord::RecordInvalid => invalid
    set_categories
    flash.now[:warning] = 'Product failed to update. Ensure that data is valid.'
    render :edit
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :slug, :price_vnd, :price_usd, :category_id, images: [])
    end
end
