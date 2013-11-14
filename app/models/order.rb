class Order < ActiveRecord::Base
  belongs_to :user


  validates_presence_of :user, message: " onbekend"
  validates_uniqueness_of :ordernr , message: " bestaat al"

  delegate :name, to: :user, prefix: :usr , allow_nil: true


  has_many :order_regels, dependent: :destroy
  accepts_nested_attributes_for :order_regels,
                                :reject_if => :all_blank,
                                :allow_destroy => true

  validates_associated :order_regels


end
