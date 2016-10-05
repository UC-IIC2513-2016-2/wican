class RepresentativesEmailsController < ApplicationController
  before_action :set_initiative

  def new
    unless current_user
      redirect_to new_session_path, notice: 'Necesitas identificarte antes de usar esta funcionalidad'
    end
    @senators = Senator.for_municipality(params[:municipality_id])
    @deputies = Deputy.for_municipality(params[:municipality_id])
  end

  def create
    re_params = params[:representatives_email]
    representatives_ids = [:senators_ids, :deputies_ids].inject([]) do |result, key|
      result.concat(re_params.key?(key) ? re_params[key] : [])
    end
    representatives = Representative.where(id: representatives_ids)
    representatives.each do |representative|
      RepresentativesMailer.initiative_email(@initiative, current_user, representative, re_params[:message]).deliver_later
    end
    redirect_to ong_initiative_path(@initiative.ong_id, @initiative), notice: 'Correos enviados'
  end

  private

  def set_initiative
    @initiative = Initiative.find(params[:initiative_id])
  end
end
