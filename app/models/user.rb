# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  has_many(:shoes, { :class_name => "Shoe", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:bottoms, { :class_name => "Bottom", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:tops, { :class_name => "Top", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:outfits, { :class_name => "Outfit", :foreign_key => "user_id", :dependent => :destroy })
end
