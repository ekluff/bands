class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)
  validates :name, presence: true
  # before_save :titleize
end

# private
#   def :titleize do
#     self.name=(name.titleize)
#   end
# end
