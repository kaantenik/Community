class MembershipRequest < ApplicationRecord
  belongs_to :user
  belongs_to :club

  validates :user_id, presence: true
  validates :club_id, presence: true
  validates :approved, inclusion: { in: [true, false] }, allow_nil: true
end
