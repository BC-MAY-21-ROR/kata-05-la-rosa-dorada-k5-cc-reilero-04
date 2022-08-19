class GildedRose

  def initialize(items)
    @items = items
    @special_items = ["Aged Brie", "Sulfuras", "Backstage passes"]
  end

  def update_quality
    @items.each do |item|

    end
  end

  def check_if_special(item)
    @special_items.each do |special|
      if item.name.include? special
        calculate_special(item)
        break
      else
        calculate_normal(item)
      end
    end
  end

  def calculate_special(item)

  end

  def calculate_normal(item)
    if item.sell_in > 0
      item.sell_in -= 1
      item.quality -= 1
    else
      item.quality -= 2
      item.quality = 0 if (item.quality < 0)
    end
  end


end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
