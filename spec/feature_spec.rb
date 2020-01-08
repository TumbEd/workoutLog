require './rails_helper'
require 'capybara/rspec'

RSpec.feature "Features", type: :feature do
  	describe 'GET #index' do
		it 'should create new' do
			visit new_workout_path

			fill_in "workout", with: "running"
			fill_in "mood", with: "lazy"
			fill_in "length", with: "60min"

			expect { click_button "Create Workout" }.to change(Workout, :count).by(1)
		end
	end

	describe 'GET #index' do
		it 'should update' do
			workout = create(:workout)
			visit edit_workout_path(workout)

			fill_in "workout", with: "swimming"
			fill_in "mood", with: "tired"
			fill_in "length", with: "30min"

			click_button "Update Workout"

			expect(workout.reload.workout).to eq "swimming"
			expect(workout.mood).to eq "tired"	
			expect(workout.length).to eq "30min"
		end
	end

	describe 'GET #index' do
		it 'should delete' do
			workout = create(:workout)

			visit workout_path(workout.id)

			page.should have_link("Delete")

			expect { click_link "Delete" }.to change(Workout, :count).by(-1)
		end
	end
end
