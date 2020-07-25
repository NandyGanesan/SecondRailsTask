class Department < ApplicationRecord
  has_many :project
  has_many :user
end
