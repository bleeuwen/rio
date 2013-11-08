class ArtikelValidator < ActiveModel::Validator
  def validate(record)
    if record.omschrijving == "Evil"
      record.errors[:base] << "This person is evil "
      ## << record.omschrijving_changed?
    end
  end

#validation:
#      when artikel is coupled to order, it can not be changed
#  etc...


end