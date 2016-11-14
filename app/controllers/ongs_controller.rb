class OngsController < ApplicationController
  layout 'application', only: [:index]

  def index
    @ongs = Ong.all
  end

  def show
    @ong = Ong.find(params[:id])
    if @ong.change_org_id
      @other_petitions = ChangeOrgApiClient.new(@ong.change_org_id).get_petitions
    end
  end
end
