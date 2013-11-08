module ArtikelgroepsHelper
  # /todo stackoverflow, user user:2933861

  def deprr_artikelgroeps_not_in_users_selection (uid)   ##depreciated
 #  This is the wrong way to do this (use a scope instead), but to make it work,
  #  you need to return an array of arguments from your method, and pass them to where with send:
    ["id NOT IN (SELECT artikelgroep_id FROM user_artikelgroeps WHERE user_id = :uid)", {uid: uid}]     #array
 #in the view you have to code:
#    <%= f.collection_select(:artikelgroep_id, Artikelgroep.send(:where , *artikelgroeps_not_in_users_selection(@user.id)), :id, :omschrijving) %>


  end

  def artikelgroeps_user_has_right_to (action_code)
    if action_code.to_s.include? "C"        # check for create
      a1="SELECT artikelgroep_id FROM user_artikelgroeps WHERE auth_c = 1 AND user_id="
    else                                    # check for update
      a1="SELECT artikelgroep_id FROM user_artikelgroeps WHERE auth_u = 1 AND user_id="
    end
    "ID in (#{a1} #{current_user.id})"
  end
end
