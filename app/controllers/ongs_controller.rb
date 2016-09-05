class OngsController < ApplicationController
  def index
    @ongs = Ong.all
  end

  def show
    @ong = Ong.find(params[:id])
  end
end
