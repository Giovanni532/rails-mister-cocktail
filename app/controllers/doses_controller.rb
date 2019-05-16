class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]

  def index
    @doses = Dose.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def edit
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail

      if @dose.save
        redirect_to @cocktail
      else
        render :new
      end
  end

  def update
    @cocktail = Cocktail.find(params[:cocktail_id])
      if @dose.update(dose_params)
        redirect_to @cocktail
      else
        render :edit
      end
  end

  def destroy
    @dose.destroy
  end

  private
    def set_dose
      @dose = Dose.find(params[:id])
    end

    def dose_params
      params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
    end
end
