require_relative "../lib/utils/prompt_utils"
require_relative "../lib/receipt/receipt"
include PromptUtils

puts "Welcome to SALES CODE CHALLENGE!\n\n"

puts "Please enter 1 item per line to add it to the order\n"
puts "e.g. 1 imported box of chocolates at 10.00"
puts "If you want to finish it, just enter an empty line\n\n"

# Input products
product_items = PromptUtils.gets_product_items_multi_line

puts "Give me a sec, processing...\n\n"

# Generates a new Receipt
Receipt.new(product_items).print

puts "\nMade with <3 by Gabriel Villoldo (gabrielvilloldo@gmail.com)\n"
