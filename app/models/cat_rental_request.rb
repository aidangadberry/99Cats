# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord

  STATUS_VALUES = ['APPROVED', 'DENIED', 'PENDING']

  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, presence: true, inclusion: STATUS_VALUES
  validate :does_not_overlap_approved_request

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  private

  def overlapping_requests
    p CatRentalRequest
    .where.not('start_date > cat_rental_requests.end_date OR end_date < cat_rental_requests.start_date')
  end

  def overlapping_approved_requests
    overlapping_requests.where('cat_rental_requests.status = \'APPROVED\'')
  end

  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?
      errors[:base] << 'This request overlaps an already approved request'
    end
  end

end
