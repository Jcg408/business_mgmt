class Business < ApplicationRecord
  has_many :clients
  has_many :services
  has_many :employees
  has_many :suppliers
end
