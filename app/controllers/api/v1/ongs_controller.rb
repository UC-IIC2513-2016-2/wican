module Api::V1
  class OngsController < ApiController

    before_action :authenticate, except: [:index]

    def index
      render json: Ong.all, include: [:initiatives]
    end

    def create
      ong = Ong.new(ong_params)
      if ong.save
        render json: ong, status: :created, location: ong_url(ong)
      else
        render json: { errors: ong.errors }, status: :unprocessable_entity
      end
    end

    private

    def ong_params
      params.require(:ong).permit(:name, :description)
    end
  end
end
