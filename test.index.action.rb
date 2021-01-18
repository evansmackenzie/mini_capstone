require "http"

puts "These are all of your products!"
response = HTTP.get("http://localhost:3000/api/products")

pp response.parse