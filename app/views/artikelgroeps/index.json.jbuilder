json.array!(@artikelgroeps) do |artikelgroep|
  json.extract! artikelgroep, :groepcode, :omschrijving, :opmerking
  json.url artikelgroep_url(artikelgroep, format: :json)
end