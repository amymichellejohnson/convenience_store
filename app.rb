require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/product")
require("./lib/purchase")
require("pg")


get('/') do
  erb(:homepage)
end

get("/manager") do
  @products = Product.all()
  erb(:index)
end

get("/cashier") do
  @purchase = Purchase.create()
  @products = Product.all()
  erb(:cashier)
end

patch("/purchase/:id") do
  purchase_id = params.fetch("id").to_i()
  @purchase = Purchase.find(purchase_id)
  product_ids = params.fetch("product_ids")
  @purchase.update(:product_ids => product_ids)
  @products= Product.all()
  erb(:cashier)
end


get("/purchase") do

  erb(:purchase)
end

post("/product") do
  name = params.fetch("name")
  price = params.fetch("price").to_i()
  Product.create({:name =>name, :price => price, :in_stock => true, :purchase_id =>nil})
  @products = Product.all()
  erb(:index)
end

get("/product/:id") do
  id = params.fetch("id").to_i()
  @found_product = Product.find(id)
  erb(:product)
end

patch("/product/:id/edit") do
  id = params.fetch("id").to_i()
  new_name = params.fetch("new_name")
  @found_product = Product.find(id)
  @found_product.update({:name => new_name})
  erb(:product)
end

patch("/product/:id/soldout") do
  id = params.fetch("id").to_i()
  @found_product = Product.find(id)
  @found_product.update({:in_stock => false})
  erb(:product)
end

delete("/product/:id/edit") do
  @found_product = Product.find(params.fetch("id").to_i())
  @found_product.delete()
  erb(:product)
end
