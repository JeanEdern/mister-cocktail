class Dose < ActiveRecord::Base
  belongs_to :cocktail
  belongs_to :ingredient
  validates :cocktail, uniqueness: { scope: :ingredient}

end
