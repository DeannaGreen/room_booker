require 'rails_helper'

describe Room do 
	describe 'validations' do 
		describe 'roomname' do
			context 'value is provided' do
				before { @room = Room.new(roomname: 'testroom') }

				it 'shoud be valid' do 
					expect(@room.valid?).to eq(true)
				end
			end

			context 'value is not provided' do
				before { @room = Room.new }

				it 'should not be valid' do
					expect(@room.valid?).to eq(false)
					expect(@room.errors.messages[:roomname]).to include("can't be blank")
				end
			end
		end
	end
end