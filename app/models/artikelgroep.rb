class Artikelgroep < ActiveRecord::Base
  has_many :artikel, dependent: :restrict_with_exception #deletes only when no children
  has_many :user_artikelgroeps, foreign_key: "artikelgroep_id", dependent: :destroy
  has_many :users, :through => :user_artikelgroeps
  validates_presence_of :groepcode, :message => " mag niet leeg zijn"
  validates_uniqueness_of  :groepcode,  message: "reeds bekend"

  default_scope -> { order('groepcode DESC') }

# retrieve artikelgroeps not yet assigned to a user
  scope :not_yet_assigned_to ,  -> (user_id) {where("id NOT IN (?)", UserArtikelgroep.where(user_id: user_id).pluck(:artikelgroep_id)<<0)}
#retrive artikelgroeps which a user may create in
  scope :user_may_create, -> (user_id) {where "id IN (?)", UserArtikelgroep.where(auth_c: true, user_id: user_id).pluck(:artikelgroep_id)}
  scope :user_may_update, -> (user_id) {where "id IN (?)", UserArtikelgroep.where(auth_u: true, user_id: user_id).pluck(:artikelgroep_id)}
#alternative to user directly: Artikelgroep.joins(:user_artikelgroeps).where(user_artikelgroeps: {auth_u: true, user_id: current_user.id})
end
