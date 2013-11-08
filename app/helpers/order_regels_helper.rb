module OrderRegelsHelper
  def artikels_order_current_user_select(artikelgroep_id, zoekphrase)
    #artikels to which user has read-rights
    artikel_join= "JOIN user_artikelgroeps ua ON ua.artikelgroep_id=artikels.artikelgroep_id
    WHERE ua.auth_r AND ua.user_id= "
    artikel_sel_groep = (!artikelgroep_id.nil?) ? [' AND ua.artikelgroep_id = ', artikelgroep_id].join : ""
    artikel_like= (!zoekphrase.nil?) ? [' AND artikels.omschrijving LIKE "%', zoekphrase, '%"'].join : ""
    "#{artikel_join} #{current_user.id} #{artikel_sel_groep} #{artikel_like} "
  end



end
