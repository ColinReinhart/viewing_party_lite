# frozen_string_literal: true

class User < ApplicationRecord
  has_many :party_users
  has_many :parties, through: :party_users

  validates :email, uniqueness: true
  validates_presence_of :name, :email

  def invited_parties
    parties.where.not(user_id: id)
  end

  def hosting_parties
    Party.where(user_id: id)
  end
end
