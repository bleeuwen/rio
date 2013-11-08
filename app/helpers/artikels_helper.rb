module ArtikelsHelper

  def artikels_current_user #base for the artikel.join
    artikel_join= "JOIN user_artikelgroeps ua ON ua.artikelgroep_id=artikels.artikelgroep_id
    WHERE (ua.auth_c OR ua.auth_r OR ua.auth_u OR ua.auth_d) AND ua.user_id= "
    "#{artikel_join} #{current_user.id}"
  end

  def artikels_current_user_search(srcval) #base for the artikel.search
    artikel_like= [' AND artikels.omschrijving LIKE "%',srcval,'%"'].join

    artikels_join=artikels_current_user
    "#{artikels_join} #{artikel_like}"
  end

  def crud_current_user(ag_id) #get CRUD by a Artikelgroep
    ua=UserArtikelgroep.where("user_id = :uid AND artikelgroep_id= :ag_id", uid: current_user.id, ag_id: ag_id).first # first and only record
    if !ua.nil?
      ua.crud
    else
      " "
    end
  end

  def user_has_any_create_artikel #must be changed, use ORM
    sel1= "SELECT count(1) FROM user_artikelgroeps ua
    WHERE ua.auth_c = 1 AND ua.user_id= "
    sqlstr= "#{sel1}  #{current_user.id}"
    crudarr=ActiveRecord::Base.connection.execute(sqlstr).first
    (crudarr[0] > 0) ? true : false
  end


  def user_may_update_artikel (id)
    aa=crud_current_user (id)
    if !aa.include? 'U'
      false
    else
      true
    end
  end

  def user_may_see_artikel (id)
    aa=artikel_crud_current_user (id)
    if aa.blank?
      false
    else
      true
    end
  end

  def user_may_delete_artikel (id)
    aa=artikel_crud_current_user (id)
    if !aa.include? 'D'
      false
    else
      true
    end
  end

end
