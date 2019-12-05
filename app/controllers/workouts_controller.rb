class WorkoutsController < ApplicationController

    before_action :find_workout, only: [:show, :edit, :update, :destroy]

	def index
		@workouts = Workout.all
	end

	def show
		
	end

	def new
		@workout = Workout.new
	end

	def create
		@workout = Workout.new(workout_prams)
		if @workout.save
			redirect_to @workout
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @workout.update(workout_prams)
			redirect_to @workout
			else
				render 'edit'
			end
	end

	def destroy
		@workout.destroy
		redirect_to root_path
	end

	private

	def workout_prams
		params.require(:workout).permit(:date, :workout, :mood, :length)
	end

	def find_workout
		@workout = Workout.find(params[:id])
	end
end