class Service < ApplicationRecord
    belongs_to :business, polymorphic: true

    validates :category, presence: true
end
