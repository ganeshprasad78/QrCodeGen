class ProductsController < ApplicationController
  before_action :authenticate_user!, except: %i[show]
  load_and_authorize_resource :except => [:show]
  before_action :set_product, only: %i[show edit update production_assign print_assign]

  def index
    search_products
    @products = @products
                .paginate(per_page: 10, page: page)
                .order(created_at: :desc)
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_url, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to products_url, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def production_assign
    @product.assign_to_production!
    redirect_to products_url, notice: 'Product has been assigned to Production team.'
  end

  def print_assign
    @product.assign_to_print!
    redirect_to products_url, notice: 'Product has been assigned to Printing team.'
  end

  def marketing_assign
    @product.assign_to_marketing!
    redirect_to products_url, notice: 'Product has been assigned to Marketing team.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def page
    params[:page] || 1
  end

  def search_products
    @products = if current_user.admin?
                  Product.all
                elsif current_user.marketing?
                  Product.for_marketing
                elsif current_user.technical?
                  Product.for_technical
                elsif current_user.production?
                  Product.for_production
                elsif current_user.printer?
                  Product.for_print
                end
  end

  def product_params
    params.require(:product).permit(:name, :description, :package, :manufacturing_date, :product_code, :data_sheet_url, :safety_sheet_url).merge!(user: current_user)
  end
end
