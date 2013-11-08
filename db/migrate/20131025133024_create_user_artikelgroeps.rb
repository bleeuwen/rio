class CreateUserArtikelgroeps < ActiveRecord::Migration
  def change
    create_table :user_artikelgroeps do |t|
      t.belongs_to :user
      t.belongs_to :artikel
      t.integer :user_id
      t.integer :artikelgroep_id
      t.boolean :auth_c
      t.boolean :auth_r
      t.boolean :auth_u
      t.boolean :auth_d

      t.timestamps
    end
  end
end
