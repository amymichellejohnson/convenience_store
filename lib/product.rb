class Product < ActiveRecord::Base

  scope(:in_stock, -> do
    where({:in_stock => true})
    end)

    belongs_to(:purchase)
end
