class AddIndicesToUserArtikelgroep < ActiveRecord::Migration
  def change
    add_index :user_artikelgroeps, :user_id
    add_index :user_artikelgroeps, :artikelgroep_id
  end
end
