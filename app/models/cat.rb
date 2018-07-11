# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'date'

class Cat < ApplicationRecord

  CAT_COLORS = ['black', 'orange', 'brown', 'gray']

  def self.colors
    CAT_COLORS
  end

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: colors }

  has_many :rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy

  def age
    ((Date.today - birth_date) / 365).to_i
  end

end
