class AddIndicesToUser < ActiveRecord::Migration
  add_index :artikels, [:artikelgroep_id]
  add_index  :users, :remember_token
end
