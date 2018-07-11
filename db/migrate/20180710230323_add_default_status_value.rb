class AddDefaultStatusValue < ActiveRecord::Migration[5.1]
  def change
    change_column_default :cat_rental_requests, :status, 'PENDING'
  end
end
