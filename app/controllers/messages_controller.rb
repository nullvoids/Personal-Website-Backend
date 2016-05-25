class MessagesController < ApplicationController
	def index
		render json: Message.all, status: 200
	end
	def create
		message = Message.new( message_params )
		puts "!!! MESSAGE PARAMS: #{message_params.inspect}"
		if message.save!
			client = SendGrid::Client.new(api_key: ENV['SENDGRID_API_KEY'])
			mail = SendGrid::Mail.new do |m|
			  m.to = 'ceballos392@gmail.com'
			  m.from = message_params[:from_email]
			  m.subject = "New personal website message from #{m.from}"
			  m.text = message_params[:message]
			end

			res = client.send(mail)
			if res.code == 200
				render json: message, status: :created
			else
				render json: {}, status: :service_unavailable
			end
		else
			render json: message.errors, status: :unprocessable_entity
		end
	end
	def update
		puts "!!! params #{params.inspect}"

	end
	private

	def message_params 
		ActiveModelSerializers::Deserialization.jsonapi_parse(params, only:[:fromEmail, :message])
	end
end
