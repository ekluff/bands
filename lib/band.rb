class Band < ActiveRecord::Base
  has_and_belongs_to_many :venues
  #
  # has_many :shows
  # has_many :venues, through: :shows

  validates :name, presence: true
  before_save :titleize

private

  def titleize
    self.name = self.name.titleize
  end

end
