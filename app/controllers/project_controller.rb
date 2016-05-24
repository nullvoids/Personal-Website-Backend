class ProjectController < ApplicationController
	def index
		puts "In Projects Index"
		projects = Project.all
		render json: projects, status: 200
	end
end
