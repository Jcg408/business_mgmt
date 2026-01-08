class Product < ApplicationRecord
  belongs_to :supplier, optional: true
end
