require("spec_helper")

describe(Purchase) do
  it("tells which products are in that purchase") do
    purchase = Purchase.create()
    product1 = Product.create({:name => "Pepsi", :price => 1.00, :purchase_id => purchase.id, :in_stock => true})
    product2 = Product.create({:name => "Mt. Dew", :price => 1.50, :purchase_id => purchase.id, :in_stock => true})
    expect(purchase.products()).to(eq([product1, product2]))
  end
end
