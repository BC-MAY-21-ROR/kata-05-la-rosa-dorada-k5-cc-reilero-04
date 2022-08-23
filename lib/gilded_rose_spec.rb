# frozen_string_literal: true

require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe '#update_quality' do
    context 'updating the quality of a new item' do
      it 'does not change the name' do
        items = [Item.new('foo', 0, 0)]
        GildedRose.new(items).update_quality
        expect(items[0].name).to eq 'foo'
      end
    end
  end
  describe '#update_quality' do
    context 'The quality is zero' do
      it 'item is never negative' do
        items = [Item.new('foo', 0, 0)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eql(0)
      end
    end
  end

  describe '#update_quality' do
    context 'The quality is zero' do
      it 'item is never negative' do
        items = [Item.new('foo', 1, 1)]
        GildedRose.new(items).update_quality
        expect(items[0].sell_in).to eql(0)
      end
    end
  end
end
