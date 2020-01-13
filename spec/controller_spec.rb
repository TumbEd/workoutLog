require './spec/rails_helper'

RSpec.describe WorkoutsController, type: :controller do
	#Passes \/
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
end
