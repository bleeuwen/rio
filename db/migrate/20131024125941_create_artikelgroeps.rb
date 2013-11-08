class CreateArtikelgroeps < ActiveRecord::Migration
  def change
    create_table :artikelgroeps do |t|
      t.string :groepcode
      t.string :omschrijving
      t.string :opmerking

      t.timestamps
    end
  end
end
