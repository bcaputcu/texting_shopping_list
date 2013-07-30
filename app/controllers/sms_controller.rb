class SmsController < ApplicationController
	def create
		message_body = params["Body"]
		from_number = params["From"]

		puts message_body

		Item.create!(name: message_body)

	end
end
