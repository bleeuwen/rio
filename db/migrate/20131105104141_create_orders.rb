class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.string :ordernr
      t.integer :user_id
      t.string :opmerking

      t.timestamps
    end
  end
end
