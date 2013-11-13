class OrderRegel < ActiveRecord::Base
  belongs_to :order
  belongs_to :artikel

  validates_presence_of :order, message: " onbekend"
  validates_presence_of :artikel, message: " onbekend"
  validates_uniqueness_of :artikel_id, :scope => :order_id, message: " al bij order aanwezig"

  delegate :usr_name, to: :order
  delegate :ordernr, to: :order, prefix: :ord
  delegate :omschrijving, to: :artikel, prefix: :art
  delegate :prijs, to: :artikel, prefix: :art
  delegate :artikelnummer, to: :artikel, prefix: :art
end
