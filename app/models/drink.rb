class Drink < ActiveRecord::Base

  ERRCODE = 1

  validates_presence_of :name, :cups
  validate :number_of_cups_should_be_greater_than_zero, :number_of_cups_should_be_less_than_ten
  validates_numericality_of :cups

  def number_of_cups_should_be_less_than_ten
    if cups >= 10
      errors.add(:cups, "-- We know you love coffee, but you couldn't have possibly drank that many cups!")
    end
  end

  def number_of_cups_should_be_greater_than_zero
    if cups <= 0
      errors.add(:cups, "-- You need some coffee!")
    end
  end
end
