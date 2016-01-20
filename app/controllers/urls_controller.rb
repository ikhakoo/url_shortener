class UrlsController < ApplicationController

	def go
    @url = Url.find_by_short_url!(params[:short_url])
    Click.create!(url_id: @url.id, referral_url: request.referrer, referral_ip: request.remote_ip)
    @total = TotalClick.find_or_create_by!(url_id: @url.id)
    @total.count += 1
    @total.save!
    redirect_to @url.target_url
  end

end
