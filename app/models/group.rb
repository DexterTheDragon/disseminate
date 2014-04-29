class Group < ActiveRecord::Base
  belongs_to :user
  has_many :services

  validates :name, presence: true
end
