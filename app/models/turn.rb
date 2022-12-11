class Turn < ApplicationRecord
  belongs_to :client

  def to_partial_path
    if self.status == "pending"
      "turns/pending_turn"
    else
      "turns/past_turn"
    end
  end
end
