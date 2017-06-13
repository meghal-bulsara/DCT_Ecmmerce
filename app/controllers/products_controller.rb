class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product.id), notice: "Successfully added #{@product.name}"
    else
      render action: "new"
    end
  end

  def show
    @review = Review.new
    @cart_line_item = CartLineItem.new
    begin
      @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to products_path, notice: "Record Not Found"
    end

  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    previous_product = @product.name
    if @product.update_attributes(product_params)
      redirect_to product_path(@product.id), notice: "Successfully updated #{previous_product} to #{@product.name}"
    else
      render action: "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: "Successfully deleted #{@product.name}"
  end

  private

  # strong parameter / safe guard from mass assignment
  def product_params
    params[:product].permit(:name, :description, :price, :category_id, :stock, :cod_eligibility, :image_url, :sub_category_id)
  end

end
