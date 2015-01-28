class Purchases < ActiveRecord::Migration
  def change
    create_table(:purchases) do |t|

      t.timestamps
    end

    add_column(:products, :purchase_id, :integer)
  end
end
