class InitiativeSignsController < ApplicationController
  def create
    @initiative = Initiative.find(params[:initiative_id])
    @ong = @initiative.ong
    sign_params = params.require(:initiative_sign).permit(:user_id, :name, :email)
    sign_params[:initiative_id] = @initiative.id
    @sign = InitiativeSign.new(sign_params)
    # Estamos incluyendo soporte para dos tipos distintos de trabajar con Ajax
    # - el uso default en que se pide formato JS en el request
    # - el uso en que se pide formato HTML explícitamente (data-type=html)
    # Normalmente basta con decidirse por uno de ellos, lo que simplifica el código.
    respond_to do |format|
      @sign_saved = @sign.save
      format.html {
        if request.xhr?
          # requests Ajax pidiendo la respuesta como HTML,
          # siempre haremos render de este partial
          render partial: 'initiatives/initiative_sign'
        else
          # request normales, dependiendo de éxito o fracaso haremos redirect o render
          if @sign_saved
            redirect_to [@initiative.ong, @initiative], notice: '¡Gracias por apoyar esta iniciativa!'
          else
            render 'initiatives/show'
          end
        end
      }
      # requests pidiendo respuesta JavaScript (caso default de Ajax en Rails)
      format.js { }
    end
  end

end
