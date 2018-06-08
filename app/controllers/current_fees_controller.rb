class CurrentFeesController < ApplicationController

  def update_current_fee
    current = CurrentFee.get || CurrentFee.new(permitted_params)
    if current.update_attributes(permitted_params)
      flash[:notice] = "Se almaceno el cuadro de tasas correctamente."
    else
      flash[:notice] = "El formato de la imagen no es el correcto."
    end
    redirect_to ("/set_current_fee")
  end

  def set_current_fee
    @current_fee = CurrentFee.get
  end

  private

  def permitted_params
    params.permit(:image)
  end

end
