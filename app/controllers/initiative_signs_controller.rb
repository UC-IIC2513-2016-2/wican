class InitiativeSignsController < ApplicationController
  def create
    @initiative = Initiative.find(params[:initiative_id])
    @ong = @initiative.ong
    sign_params = params.require(:initiative_sign).permit(:user_id, :name, :email)
    sign_params[:initiative_id] = @initiative.id
    @sign = InitiativeSign.new(sign_params)
    if @sign.save
      redirect_to [@initiative.ong, @initiative], notice: '¡Gracias por apoyar esta iniciativa!'
    else
      render 'initiatives/show'
    end
  end

end
