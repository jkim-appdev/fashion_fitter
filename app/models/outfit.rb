# == Schema Information
#
# Table name: outfits
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bottom_id  :integer
#  shoes_id   :integer
#  top_id     :integer
#  user_id    :integer
#
class Outfit < ApplicationRecord
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:top, { :required => false, :class_name => "Top", :foreign_key => "top_id", :counter_cache => true })
  belongs_to(:bottom, { :required => false, :class_name => "Bottom", :foreign_key => "bottom_id", :counter_cache => true })
  belongs_to(:shoes, { :required => false, :class_name => "Shoe", :foreign_key => "shoes_id", :counter_cache => true })
end
