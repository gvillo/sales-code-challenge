require_relative "../../lib/product/product_item"
require_relative "../../lib/product/product_item_type"

class ProductItemFactory

  # @return ProductItem
  def self.create(sentence)
    @product_item = ProductItem.new
    #
    words = sentence.split(" ")
    parse(words)
    #
    set_imported
    set_type
    #
    @product_item
  end

  private

  def self.parse(words)
    @product_item.quantity = words[0].strip.to_i
    @product_item.price = words[words.length - 1].strip.to_f
    @product_item.description = words[1..words.length - 2].join(" ")
  end

  def self.set_imported
    @product_item.is_imported = @product_item.description.include?("imported")
  end

  def self.set_type
    description = @product_item.description
    if description.include?("book")
      @product_item.type = ProductItemType::BOOK
    elsif description.include?("pills")
      @product_item.type = ProductItemType::MEDICAL
    elsif description.include?("chocolate")
      @product_item.type = ProductItemType::FOOD
    else
      @product_item.type = ProductItemType::OTHER
    end
  end
end