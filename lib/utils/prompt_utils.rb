require_relative "../../lib/product/product_item_factory"

module PromptUtils

  # @return [Array] Array of ProductItems
  def gets_product_items_multi_line
    result = []
    while (text = gets) != "\n"
      result << ProductItemFactory.create(text)
    end
    result
  end

end