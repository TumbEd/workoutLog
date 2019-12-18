require './rails_helper'

RSpec.describe Workout, type: :model do
  context 'validation tests' do
  	it 'ensulre workout presence' do
  		workout = Workout.new(mood: 'lazy', length: '20min').save
  		expect(workout).to eq(false)
  	end

  	it 'ensulre mood presence' do
  		workout = Workout.new(workout: 'running', length: '20min').save
  		expect(workout).to eq(false)
  	end

  	it 'ensulre length presence' do
  		workout = Workout.new(mood: 'lazy', workout: 'running').save
  		expect(workout).to eq(false)
  	end

  	it 'should save sucessfully' do
  		workout = Workout.new(workout: 'running', mood: 'lazy', length: '20min').save
  		expect(workout).to eq(true)
  	end
  end
end
