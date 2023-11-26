class Invitation < ApplicationRecord
    belongs_to :event
    has_many :guests, class_name: 'User'
end
