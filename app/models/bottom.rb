# == Schema Information
#
# Table name: bottoms
#
#  id            :integer          not null, primary key
#  brand         :string
#  image         :string
#  outfits_count :integer
#  price         :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#
class Bottom < ApplicationRecord
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })
  has_many(:outfits, { :class_name => "Outfit", :foreign_key => "bottom_id", :dependent => :nullify })
end
