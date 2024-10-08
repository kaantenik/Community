class Club < ApplicationRecord
  resourcify
  has_rich_text :description
 # belongs_to :president, class_name: 'User', foreign_key: 'president_id', optional: true
  has_many :membership_requests
  has_many :requesting_users, through: :membership_requests, source: :user

end
