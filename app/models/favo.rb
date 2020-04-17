class Favo < ApplicationRecord
  validates :user_id, {presence: true}
  validates :memo_id, {presence: true}
end
