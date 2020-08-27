class MasterListsController < ApplicationController
  before_action :authenticate_user!, except: %i[show]
  load_and_authorize_resource :except => [:show]
  before_action :set_master_list, only: %i[show edit update destroy]

  def index
  	@master_lists = MasterList
  					.all
  					.order(:name)
  					
  	@master_lists = if params[:archived] == 'true'
  					  @master_lists.where(archived: true)
  					else
  						@master_lists.where(archived: false)
  					end
    @master_lists = @master_lists.paginate(per_page: 20, page: params[:page])
  end

  def show; end

  def new
    @master_list = MasterList.new
  end

  def edit; end

  def create
    @master_list = MasterList.new(master_list_params)

    if @master_list.save
      redirect_to master_lists_url, notice: 'MasterList was successfully created.'
    else
      render :new
    end
  end

  def update
    if @master_list.update(master_list_params)
      redirect_to master_lists_url, notice: "#{@master_list.name} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
  	@master_list.toggle!(:archived)
  	notice = if @master_list.archived?
  			   "#{@master_list.name} has been archived."
  			 else
  			   "#{@master_list.name} has been enabled."
  			 end
  	redirect_to master_lists_url(archived: !@master_list.archived), notice: "#{notice}"
  end

  private

  def set_master_list
    @master_list = MasterList.find(params[:id])
  end

  def page
    params[:page] || 1
  end

  def master_list_params
    params.require(:master_list).permit(:name, :application, :package, :data_sheet_url,
    									:safety_sheet_url, :name_hidden, :application_hidden,
    									:package_hidden, :data_sheet_hidden, :safety_sheet_hidden).merge!(user: current_user)
  end

end
