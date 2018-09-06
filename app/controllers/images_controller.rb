class ImagesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    if params[:query]
      url = BingImage.search(params[:query])
      render json: [url]
    end
  end
end
