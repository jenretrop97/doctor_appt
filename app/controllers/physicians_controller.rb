class PhysiciansController < ApplicationController
  before_action :set_physician, only: [:edit, :show, :update, :destroy]
  
  def index
    @physicians = Physician.all
  end

  def new
    @physicians = Physician.new
  end

  def create
    @physician = Physician.create(physician_params)
    if @physician.save
      redirect_to physicians_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    @physician = Physician.find(params[:id])
    if @physician.update(physician_params)
      redirect_to physicians_path
    else
      render :edit
    end
  end


  def destroy
    @physician.destroy
    redirect_to physicians_path
  end

private

  def set_physician
  @physician = Physician.find(params[:id])
  end

  def physician_params
  params.require(:physician).permit(:name, :email, :specialty)
  end
end