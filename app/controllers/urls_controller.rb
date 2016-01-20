class UrlsController < ApplicationController

	def go
    @url = Url.find_by_short_url!(params[:short_url])
    redirect_to @url.target_url
  end

end
