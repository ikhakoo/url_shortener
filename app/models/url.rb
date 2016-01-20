class Url < ActiveRecord::Base
	has_many :clicks
	belongs_to :total_clicks
	validates :short_url, :uniqueness => true
end
