class UserArtikelgroep < ActiveRecord::Base
  belongs_to :user
  belongs_to :artikelgroep

  validates_presence_of :user, message: " onbekend"
  validates_presence_of :artikelgroep, message: " onbekend"

  validates_uniqueness_of :artikelgroep_id, :scope => :user_id, message: " al bij user aanwezig"

  delegate :groepcode, to: :artikelgroep, prefix: :ag
  delegate :name, to: :user, prefix: :usr

def crud
  xa=[(auth_c)? "C":" ", (auth_r)? "R":" ", (auth_r)? "U":" ", (auth_d)? "D":" "]
  xa.join
end

end
