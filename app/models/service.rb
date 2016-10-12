class Service < ActiveRecord::Base
    has_many :ServicePackages
    has_many :packages, through: :ServicePackages
    validates :name ,:description, presence: true
    validates :name, length: { minimum: 3 , maximun: 20}
    validates :description, length: { minimum: 10 , maximun: 250}
    has_many :operations
    has_many :users, through: :operations
end
