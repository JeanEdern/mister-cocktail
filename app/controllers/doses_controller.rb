class DosesController < ApplicationController
  before_action :find_cocktail, only: [ :new, :create]

  def new
    @dose = @cocktail.doses.build
  end

  def create
    # Ces deux dernières lignes sont équivalents à la version build
    # @dose  = Dose.new(dose_params)
    # @dose.cocktail = @cocktail

    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
