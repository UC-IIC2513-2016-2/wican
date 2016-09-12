class OngsController < ApplicationController
  layout 'application', only: [:index]

  def index
    @ongs = Ong.all
  end

  def show
    @ong = Ong.find(params[:id])
  end
end
