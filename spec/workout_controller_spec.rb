require './rails_helper'

RSpec.describe WorkoutsController, type: :controller do
	render_views
	context 'GET #index' do
		it 'should returns a success response' do
			get :index
			expect(response).to have_http_status(200)
			expect(response).to render_template('workouts/index')
		end
	end

	context 'GET #now' do
		it 'should returns a success response' do
			Workout.create!(date: Date.today, workout: 'running', mood: 'lazy', length: '60min')
			get :new
			expect(response.body) =~ /running/m
		end
	end

	context 'GET #index' do
		it 'should create new' do
			visit new_workout_path

			fill_in "workout", with: "running"
			fill_in "mood", with: "lazy"
			fill_in "length", with: "60min"

			expect { click_button "Create Workout" }.to change(Workout, :count).by(1)
		end
	end

	context 'GET #index' do
		it 'should update' do
			visit edit_workout_path(workout.id)

			fill_in "workout", with: "swimming"
			fill_in "mood", with: "tired"
			fill_in "length", with: "30min"

			click_button "Update Workout"

			expect(workout.reload.workout).to eq "swimming"
			expect(worout.mood).to eq "tired"	
			expect(worout.length).to eq "30min"
		end
	end

	context 'GET #index' do
		it 'should delete' do
			Workout.create!(date: Date.today, workout: 'running', mood: 'lazy', length: '60min')

			visit workout_path(workout.id)

			page.should have_link("Delete")

			expect { click_link "Delete" }.to change(Workout, :count).by(-1)
		end
	end
end