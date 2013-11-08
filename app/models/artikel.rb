#require "#{Rails.root}/lib/validators/artikel_validator.rb"
class Artikel < ActiveRecord::Base
  belongs_to :artikelgroep
  has_many :order_regels

  validates :artikelnummer, presence: true, uniqueness: true
  # validates :artikelgroep_id, presence: true
  validates_presence_of :prijs, :message => " mag niet leeg zijn"
  validates :omschrijving, presence: true
  validates_presence_of :artikelgroep, message: " onbekend"

  validates_with ArtikelValidator

  delegate :groepcode, to: :artikelgroep
  delegate :omschrijving, to: :artikelgroep, prefix: :ag

# zie ook: http://stackoverflow.com/questions/5597347/rails-3-custom-validator-problem

end