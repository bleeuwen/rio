class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_regels, dependent: :destroy

  validates_presence_of :user, message: " onbekend"
  validates_uniqueness_of :ordernr , message: " bestaat al"

  delegate :name, to: :user, prefix: :usr
end
