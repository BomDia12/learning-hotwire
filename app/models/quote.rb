class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(name: :asc) }

  broadcasts_to -> ( quote ) { "quotes_stream" }, inserts_by: :prepend
end
