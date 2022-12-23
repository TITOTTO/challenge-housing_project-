require 'spec_helper'
require_relative '../lib/housing_project'

RSpec.describe HousingProject do
    describe 'initialize' do 
        let(:housingproject) {HousingProject.new(name: "Project", interests: 50, delivery_time: DateTime.now)}
        let(:house) {House.new(length: 1, width: 1, floors: 1, price_m2: 1.0)}
        it 'Create a new model' do
            expect(housingproject.name).to eq "Project"
            expect(housingproject.interests).to eq 50
            expect(housingproject.delivery_time.to_date).to eq DateTime.now.to_date
            expect(housingproject.house_number).to eq 0
            expect{housingproject.description}.not_to raise_error
        end
        it 'add a new house' do
            expect{housingproject.add_house(house)}.to change{housingproject.house_number}.by 1
        end
        it 'shows interest' do
            housingproject.add_house(house)
            # expect(housingproject.send(interest_percentage)).to eq 1.5
            # Je comprends pas !
            expect(housingproject.interests).to eq 50
        end
    end

    describe 'Creation with data error' do 
        it 'displays errors on wrong information' do
            expect{HousingProject.new(name: 15, interests: 50, delivery_time: DateTime.now)}
                .to raise_error(ArgumentError, 'Name should be a String')
            expect{HousingProject.new(name: "Project", interests: "Project", delivery_time: DateTime.now)}
                .to raise_error(ArgumentError, 'Interests should be an Integer')
            expect{HousingProject.new(name: "Project", interests: 50, delivery_time: "DateTime.now")}
                .to raise_error(ArgumentError, 'Delivery Time should be a Date')
        end
    end

    describe 'Method error' do 
        let(:housingproject) {HousingProject.new(name: "Project", interests: 50, delivery_time: DateTime.now)}
        it 'is not a house' do
            expect{housingproject.add_house("Ceci est une maison")}
                .to raise_error(RuntimeError)
            expect{housingproject.add_house(House.new)}
                .to raise_error(ArgumentError, "missing keywords: :length, :width, :floors, :price_m2")
        end

    end

end
