class Review < ApplicationRecord
  belongs_to :list

  validates :rating, presence: true, numericality: { only_integer: true }
end
