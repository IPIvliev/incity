# == Schema Information
#
# Table name: streets
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Street < ActiveRecord::Base
  attr_accessible :name, :street_id
  has_many :users
  has_many :microposts

  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  def follow!(other_user)
    relationships.create!(followed_id: street.id)
  end

end