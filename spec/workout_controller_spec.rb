require './rails_helper'

RSpec.describe WorkoutsController, type: :controller do
	context 'GET #index' do
		it 'should returns a success response' do
			get :index
			expect(response).to be_success
		end
	end

	context 'GET #now' do
		it 'should returns a success response' do
			workout = Workout.create!(workout: 'running', mood: 'lazy', length: '60min')
			get :new, params: { id: workout.to_param }
			expect(response).to be_success
		end
	end
end