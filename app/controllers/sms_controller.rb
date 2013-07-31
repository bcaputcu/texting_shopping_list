class SmsController < ApplicationController

	skip_before_filter :verify_authenticity_token

	def create
		message_body = params["Body"]
		from_number = params["From"]

		current_list_names = []
		Item.current_list.each {|item| current_list_names.push item.name}

		current_list_string = current_list_names.join(',')

		if message_body.casecmp('list') == 0
			to_send = current_list_string
		else
			item = Item.create(name: message_body)

			if item.valid?
				to_send = "#{item.name} added. Current list: #{current_list_string}".truncate(160)
			else
				to_send = "Error! Report to Berk Caputcu!"
			end
		end

		@twilio_client = Twilio::REST::Client.new ENV['twilio_sid'], ENV['twilio_token']

		@twilio_client.account.sms.messages.create(
			:from => "+1#{ENV['twilio_phone_number']}",
			:to => from_number,
			:body => to_send
			)

		render :json => { :status => :ok }
	end
end
