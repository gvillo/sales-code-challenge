require_relative "../../lib/tax/tax_calculator"

class Cart

  def initialize(product_items)
    @product_items = product_items
  end

  def print_receipt
    print_header
    #
    @total_sales_taxes = 0.0
    @total = 0.0
    #
    @product_items.each do |product_item|
      taxes = TaxCalculator.new(product_item).calculate_taxes
      print_item(product_item, taxes)
      #
      @total_sales_taxes += taxes
      @total += product_item.total_price
    end
    #
    print_totals
    print_footer
  end

  private

  def print_header
    puts "######################################"
    puts "######## SALES STORE RECEIPT  ########"
    puts "######################################\n\n"
  end

  def print_item(product_item, taxes)
    puts "#{product_item.quantity} #{product_item.description} #{sprintf("%.2f", product_item.total_price + taxes)}"
  end

  def print_footer
    puts "\nThank you for purchasing at SALES Store!"
  end

  def print_totals
    puts "Sales Taxes: #{sprintf("%.2f", @total_sales_taxes)}"
    puts "Total: #{sprintf("%.2f", @total + @total_sales_taxes)}"
  end
end