class Game < ApplicationRecord
    scope :available, -> {where(black_player_id: nil)}
end
