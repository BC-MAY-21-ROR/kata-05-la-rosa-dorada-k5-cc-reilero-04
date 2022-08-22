class GildedRose

  def initialize(items)
    @items = items # Array de Objetos Item
    @special_items = ["Aged Brie", "Sulfuras", "Backstage passes" , "Conjured"] # Conjured
  end

  def update_quality
    @items.each do |item|
      type = check_if_special(item)
      if type == 0
        # Calc Aged Brie
        item.sell_in -= 1
        calc_AB(item)
      elsif type == 1
        # Calc Sulfuras
        item.quality == 80
        calc_Sulfuras(item)
      elsif type == 2
        # Calc Backstage passes
        item.sell_in -= 1
        calc_Bp(item)
      elsif type == 3
        # Calc conjured item
        item.sell_in -= 1
        item.quality -= 2
        (item.quality -= 2) if (item.sell_in <= 0)
        (item.quality = 0) if (item.quality < 0)
      else
        # Calc normal
        item.sell_in -= 1
        item.quality -= 1
        (item.quality -= 1) if (item.sell_in <= 0)
        (item.quality = 0) if (item.quality < 0)
      end
    end
  end

  # Boolean, checks if the item is either Aged Brie, Sulfuras or Backstage passes
  def check_if_special(item)
    @special_items.each_with_index do |special, index|
      if item.name.include? special
        return index
      end
    end
    return -1
  end

  # Calculates and modifies the quality of Aged Brie +
  def calc_AB(item)
    unless item.quality == 50
      item.quality += 1
    end
    (item.quality = 50) if (item.quality > 50)
  end

  # Calculates and modifies the quality of Sulfuras
  def calc_Sulfuras(item)
    item.quality = 80
  end

  # Calculates and modifies the quality of Backstage passes
  def calc_Bp(item)
    unless item.quality == 50
      if item.sell_in > 10
        item.quality += 1
      elsif item.sell_in > 5
        item.quality += 2
      elsif item.sell_in >= 0
        item.quality += 3
        else
          item.quality = 0
        end
    end
    (item.quality = 50) if (item.quality > 50)
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
