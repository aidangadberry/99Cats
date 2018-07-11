# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'date'

# birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null

#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null

Cat.destroy_all
CatRentalRequest.destroy_all

cat1 = Cat.create!(birth_date: Date.new(2000, 11, 20), color: 'orange', name: 'Garfield', sex: 'M', description: 'Orange cat')
cat2 = Cat.create!(birth_date: Date.new(2010, 4, 7), color: 'black', name: 'Bob', sex: 'M', description: 'Black cat')

cr1 = CatRentalRequest.create!(cat_id: cat1.id, start_date: Date.new(2018, 7, 1), end_date: Date.new(2018, 7, 4), status: 'APPROVED')
cr2 = CatRentalRequest.create!(cat_id: cat1.id, start_date: Date.new(2018, 7, 3), end_date: Date.new(2018, 7, 5), status: 'PENDING')
