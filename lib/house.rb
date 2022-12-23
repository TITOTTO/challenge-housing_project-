require 'date'
require 'securerandom'

class House
  attr_reader :id, :length, :width, :floors, :created_at, :price_m2

  def initialize(length:, width:, floors:, price_m2:)
    @id = SecureRandom.uuid
    @length = length
    @width = width
    @floors = floors
    @price_m2 = price_m2
    @created_at = Date.today
    validate_input
  end

  def perimeter
    (length + width) * 2
  end

  def surface_area
    (length * width) * floors
  end

  def identity_card
    {
      length: "This house has a #{length} meters length",
      width: "This house has a #{width} meters width",
      floors: "This house has #{width} floors",
      created_at: "This house was created #{created_at.strftime('%A, the %d of %B, %Y')}",
    }
  end

  def price
    surface_area * price_m2
  end

  def display_price
    "#{price} $"
  end

  private

  def validate_input
    raise ArgumentError, 'Length should be an Integer' unless length.is_a? Integer
    raise ArgumentError, 'Width should be an Integer' unless width.is_a? Integer
    raise ArgumentError, 'Floors should be an Integer' unless floors.is_a? Integer
    raise ArgumentError, 'Square meter Price should be a Float' unless price_m2.is_a? Float
  end
end
