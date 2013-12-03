# == Schema Information
#
# Table name: microposts
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  street_id  :integer
#

class Micropost < ActiveRecord::Base
  attr_accessible :content, :street_id
  belongs_to :user
  belongs_to :street

  validates :user_id, presence: true
  validates :street_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  default_scope order: 'microposts.created_at DESC'

  def self.from_streets_followed_by(user)
    followed_streets_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("street_id IN (#{followed_streets_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end