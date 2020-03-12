require_relative "../../lib/product/product_item_type"

class TaxCalculator
  BASIC_SALES_TAX_PERCENT = 0.10
  IMPORT_DUTY_TAX_PERCENT = 0.05
  NEAREST_ROUND_PRECISION = 0.05

  def initialize(product_item)
    @product_item = product_item
  end

  # @return [float]
  def calculate_taxes
    basic_sales_tax = !is_tax_exempt ? @product_item.price * BASIC_SALES_TAX_PERCENT : 0.0
    import_duty_tax = @product_item.is_imported ? @product_item.price * IMPORT_DUTY_TAX_PERCENT : 0.0
    #
    round_up_to_nearest(basic_sales_tax + import_duty_tax, NEAREST_ROUND_PRECISION) * @product_item.quantity
  end

  private

  # @return [float] Given value rounded up to nearest precision
  def round_up_to_nearest(value, precision)
    (value / precision).ceil * precision
  end

  def is_tax_exempt
    tax_exempt_products.any?(@product_item.type)
  end

  def tax_exempt_products
    [ProductItemType::BOOK, ProductItemType::FOOD, ProductItemType::MEDICAL]
  end

end