class Api::V1::UrlsController < ApplicationController
	before_action :set_url, only: [:show]
  before_filter :restrict_access
      
  def index
    @urls = Url.all

    render json: @urls
  end

  def show
    render json: @url
  end

  def create
    @url = Url.new(url_params)

    if @url.save
      render json: @url, status: :created, location: @url
    else
      render json: @url.errors, status: :unprocessable_entity
    end
    
  end

  def update
    @url = Url.find(params[:id])

    if @url.update(url_params)
      head :no_content
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @url.destroy

    head :no_content
  end

  private

    def set_url
      @place = Url.find(params[:id])
    end

    def url_params
      params.require(:url).permit(:target_url, :short_url)
    end
end
