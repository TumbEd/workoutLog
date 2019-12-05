class WorkoutsController < ApplicationController

    before_action :find_workout, only: [:show, :edit, :update, :destroy]

	def index
		
	end

	def show
		
	end

	def new
		@workout = Workout.new
	end

	def create
		@workout = Workout.new(workou_prams)
		if @workout.save
			redirect_to @workout
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	private

	def workou_prams
		params.require(:workout).permit(:date, :workout, :mood, :length)
	end

	def find_workout
		@workout = Workout.find(params[:id])
	end
end