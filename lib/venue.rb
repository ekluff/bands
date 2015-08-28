class Venue < ActiveRecord::Base
  has_and_belongs_to_many :bands
  validates :name, presence: true
  # before_save :titleize
end

# has_many :shows
# has_many :bands, through :shows
