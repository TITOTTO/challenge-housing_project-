require 'spec_helper'
require_relative '../lib/house'

RSpec.describe House, :type => :model do
    describe 'initialize' do 
        let(:house) { House.new(length: 1, width: 1, floors: 1, price_m2: 1.0) }
        it 'Create new model' do
            expect(house.length).to eq 1
            expect(house.width).to eq 1
            expect(house.floors).to eq 1
            expect(house.price_m2).to eq 1.0
        end

        it 'calculate perimeter' do
            expect(house.perimeter).to eq 4
        end

        it 'calculate surface area' do
            expect(house.surface_area).to eq 1.0
        end

        it 'calculate price' do
            expect(house.price).to eq 1.0
        end
        it 'display house information' do
            expect{house.identity_card}.not_to raise_error
        end
    end
    describe 'initialize with error message' do
        it {expect{House.new(length: "1", width: 1, floors: 1, price_m2: 1.0)}
            .to raise_error(ArgumentError, 'Length should be an Integer')}
    end
end
