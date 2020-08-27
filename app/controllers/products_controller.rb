class ProductsController < ApplicationController
  before_action :authenticate_user!, except: %i[show authenticate_pin]
  load_and_authorize_resource :except => [:show]
  before_action :set_product, only: %i[authenticate_pin show edit update production_assign print_assign print generate_qr_code]

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

  def generate_qr_code
    @product.generate_qr_code!
    redirect_to products_url, notice: 'Qr code has been generated.'
  end

  def print
    render layout: 'print'
  end

  def authenticate_pin
    @detailed = if params[:pin] == '1234'
                  true
                else 
                  false
                end
    render :product
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
    params.require(:product).permit(:master_list_id, :manufacturing_date, :product_code,
                                    :manufacturing_date_hidden, :product_code_hidden).merge!(user: current_user)
  end
end
