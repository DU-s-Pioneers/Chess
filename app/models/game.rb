class Game < ApplicationRecord
  scope :available, -> {where(available: true)}
end
