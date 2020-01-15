require './spec/rails_helper'
require 'capybara/rspec'

RSpec.feature "Features", type: :feature do
	#Ambiguous match, found 2 elements matching visible xpath "/html" \/
	given!(:workout) { Workout.new(date: Date.today, workout: 'running', mood: 'lazy', length: '20min') }

	scenario 'with valid credentials' do
		visit new_workout_path

		fill_in 'workout[workout]', with: workout.workout
		fill_in 'workout[mood]', with: workout.mood 
		fill_in 'workout[length]', with: workout.length
		click_button 'Create Workout'

		expect(page).to have_content 'Add an exercise'
	end
	#passes \/
  	describe 'GET #index' do
		it 'should create new' do
			visit "/workouts/new"

			fill_in 'workout[workout]', with: "running"
			fill_in 'workout[mood]', with: "lazy"
			fill_in 'workout[length]', with: "60min"

			expect { click_button 'Create Workout' }.to change(Workout, :count).by(1)
		end
	end
	#No route matches {:action=>"edit", :controller=>"workouts", :id=>#<Workout id: nil, date: "2020-01-15 00:00:00", workout: "running", mood: "lazy", length: "20min", created_at: nil, updated_at: nil>}, possible unmatched constraints: [:id] \/
	describe 'GET #index' do
		it 'should update' do
			workout = Workout.new(date: Date.today, workout: 'running', mood: 'lazy', length: '20min')
			visit edit_workout_path(workout)

			fill_in 'workout[workout]', with: "running"
			fill_in 'workout[mood]', with: "lazy"
			fill_in 'workout[length]', with: "60min"

			click_button 'Update Workout'

			expect(workout.reload.workout).to eq "swimming"
			expect(workout.mood).to eq "tired"
			expect(workout.length).to eq "30min"
		end
	end
	#No route matches {:action=>"show", :controller=>"workouts", :id=>nil}, possible unmatched constraints: [:id] \/
	describe 'GET #index' do
		it 'should delete' do
			workout = Workout.new(date: Date.today, workout: 'running', mood: 'lazy', length: '20min')

			visit workout_path(workout.id)

			page.should have_link("Delete")

			expect { click_link "Delete" }.to change(Workout, :count).by(-1)
		end
	end
end