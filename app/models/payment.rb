class Payment < ApplicationRecord
  has_many :events, dependent: :destroy
end
