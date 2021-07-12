# frozen_string_literal: true

class Provider < ApplicationRecord
  has_many :flights, dependent: :destroy


  validates :name, presence: true
end
