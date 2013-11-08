class CreateOrderRegels < ActiveRecord::Migration
  def change
    create_table :order_regels do |t|
      t.belongs_to :order
      t.belongs_to :artikel
      t.integer :order_id
      t.integer :artikel_id
      t.integer :aantal
      t.string :opmerking

      t.timestamps
    end
  end
end
