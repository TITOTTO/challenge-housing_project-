require_relative 'house'
require 'pry'

class HousingProject
  attr_reader :name, :delivery_time
  attr_accessor :houses, :interests

  def initialize(name:, interests:, delivery_time:)
    @name = name
    @interests = interests
    @delivery_time = delivery_time
    @houses = []
    validate_input
  end

  def add_house(house)
    raise unless house.is_a? House
    houses << house
  end

  def delete_house(id)
    @houses = houses.reject { |house| house.id == id }
  end

  def house_number
    houses.count
  end

  def description
    {
      name: "This Housing Project is called #{name}",
      house_count: "This Project contains #{house_number} houses",
      costs: "The Project is valued at #{project_costs} $",
      selling_value: "We wish to sell the project for #{project_invest_return_price} $",
      roi: "The return on investment is #{interests} %",
      delivery_time: "#{delivery_time.strftime('%A, the %d of %B, %Y')}",
      area: "#{project_surface} m2 of housing"
    }
  end

  private

  def project_surface
    houses.map(&:surface_area).sum
  end

  def project_costs
    houses.map(&:price).sum
  end

  def project_invest_return_price
    project_costs * interest_percentage
  end

  def interest_percentage
    (100 + interests) / 100.to_f
  end

  def validate_input
    raise ArgumentError, 'Name should be a String' unless name.is_a? String
    raise ArgumentError, 'Interests should be an Integer' unless interests.is_a? Integer
    raise ArgumentError, 'Delivery Time should be a Date' unless delivery_time.is_a? Date
  end
end
