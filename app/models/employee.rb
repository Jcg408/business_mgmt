class Employee < ApplicationRecord
  belongs_to :business

  validates_presence_of :name
end
