class CreateArtikels < ActiveRecord::Migration
  def change
    create_table :artikels do |t|
      t.string :artikelnummer
      t.string :omschrijving
      t.decimal :prijs, :precision => 9, :scale => 2
      t.string :opmerking
      t.integer :artikelgroep_id
      t.timestamps
    end
  end

end
