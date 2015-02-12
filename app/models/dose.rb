class Dose < ActiveRecord::Base
  belongs_to :cocktail
  belongs_to :ingredient
  validates :cocktail_id, presence: true, uniqueness: true
  validates :ingredient_id, presence: true, uniqueness: true
end
