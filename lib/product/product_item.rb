class ProductItem
  attr_accessor :quantity, :price, :description, :is_imported, :type

  def total_price
    @price * @quantity
  end
end