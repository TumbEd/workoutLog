require './spec/rails_helper'
require 'capybara/rspec'

RSpec.feature "Features", type: :feature do
	#passes \/
	given!(:workout) { Workout.new(date: Date.today, workout: 'running', mood: 'lazy', length: '20min') }

	scenario 'with valid credentials' do
		visit new_workout_path

		fill_in 'workout[workout]', with: workout.workout
		fill_in 'workout[mood]', with: workout.mood 
		fill_in 'workout[length]', with: workout.length
		click_button 'Create Workout'

		expect(page).to have_content 'Add an exercise'
	end
  	describe 'GET #index' do
		it 'should create new' do
			visit "/workouts/new"

			fill_in 'workout[workout]', with: "running"
			fill_in 'workout[mood]', with: "lazy"
			fill_in 'workout[length]', with: "60min"

			expect { click_button 'Create Workout' }.to change(Workout, :count).by(1)
		end
	end
	describe 'GET #index' do
		it 'should update' do
			workout = Workout.new(date: Date.today, workout: 'running', mood: 'lazy', length: '20min')
			workout.save

			visit "/workouts/#{workout.id}/edit"

			fill_in 'workout[workout]', with: "swimming"
			fill_in 'workout[mood]', with: "tired"
			fill_in 'workout[length]', with: "30min"

			click_button 'Update Workout'

			expect(page).to have_content 'swimming'
			expect(page).to have_content 'tired'
			expect(page).to have_content '30min'
		end
	end
	describe 'GET #index' do
		it 'should delete' do
			workout = Workout.new(date: Date.today, workout: 'running', mood: 'lazy', length: '20min')
			workout.save

			visit "/workouts/#{workout.id}"

			expect { click_on 'Delete' }.to change(Workout, :count).by(-1)
		end
	end
end