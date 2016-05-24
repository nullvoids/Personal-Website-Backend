class MessagesController < ApplicationController
	def index
		render json: Messages.all
	end
	def create
		message = Message.new( message_params )

		if message.save!
			render json: message, status: :created
		else
			render json: message.errors, status: :unprocessable_entity
		end
	end
	def update
		puts "!!! params #{params.inspect}"

	end

	def message_params 
		params.require(:message).permit(:from_email, :message)
	end
end
