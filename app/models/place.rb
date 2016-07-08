class Place < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true, length: { maximum: 140, minimum: 3}
  validates :address, :description, presence: true
  self.per_page = 5
end
