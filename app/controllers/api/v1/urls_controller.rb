class Api::V1::UrlsController < ApplicationController
	before_action :set_url, only: [:show]
  before_filter :restrict_access
      
  # GET api/v1/urls
  # GET api/v1/urls.json
  def index
    @urls = Url.all

    render json: @urls
  end

  # GET api/v1/urls/1
  # GET api/v1/urls/1.json
  def show
    render json: @url
  end

  # POST /urls
  # POST /urls.json
  def create
    @url = Url.new(url_params)

    if @url.save
      render json: @url, status: :created, location: @url
    else
      render json: @url.errors, status: :unprocessable_entity
    end
    
  end

  # PATCH/PUT /urls/1
  # PATCH/PUT /urls/1.json
  def update
    @url = Url.find(params[:id])

    if @url.update(url_params)
      head :no_content
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  # DELETE /urls/1
  # DELETE /urls/1.json
  def destroy
    @url.destroy

    head :no_content
  end

  private

    def set_url
      @place = Url.find(params[:id])
    end

    # def restrict_access
    #   authenticate_or_request_with_http_token do |token, options|
    #     ApiKey.exists?(access_token: token)
    #   end
    # end

    def url_params
      params.require(:url).permit(:target_url, :short_url)
    end
end
