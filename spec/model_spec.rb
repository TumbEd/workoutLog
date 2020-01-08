require './rails_helper'

RSpec.describe Workout, type: :model do
  describe Workout, '#name' do
  	it 'returns with workout info' do
  		workout = build(:workout, workout: 'Running', mood: 'Lazy', lenght: '60min')

  		expect(workout.name).to eq 'Running Lazy 60min'
  	end
  end
end