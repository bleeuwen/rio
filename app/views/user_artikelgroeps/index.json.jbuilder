json.array!(@user_artikelgroeps) do |user_artikelgroep|
  json.extract! user_artikelgroep, :user_id, :artikelgroep_id, :auth_c, :auth_r, :auth_u, :auth_d
  json.url user_artikelgroep_url(user_artikelgroep, format: :json)
end