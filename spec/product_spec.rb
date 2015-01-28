require("spec_helper")

describe(Product) do
  describe(".in_stock") do
    it("returns the products in stock") do
     in_stock_product = Product.create({:name => "Mountain Dew", :price => 1.50, :in_stock => true, :purchase_id => nil})
     in_stock_product2 = Product.create({:name => "Pepsi", :price => 2.50, :in_stock => true, :purchase_id => nil})
     stocked_products = [in_stock_product,in_stock_product2]
     not_in_stock_product = Product.create({:name => "Dr. Pepper", :price => 1.75, :in_stock => false, :purchase_id => nil})
     expect(Product.in_stock()).to(eq(stocked_products))
   end
 end
   it("tells which purchase it belongs to") do
     purchase = Purchase.create()
     product = Product.create({:name => "Pepsi", :price => 1.00, :purchase_id => purchase.id, :in_stock => true})
     expect(product.purchase()).to(eq(purchase))
   end
end
