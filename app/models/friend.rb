class Friend < ActiveRecord::Base
  validates :user_name, uniqueness: true
  validates :int8, uniqueness: true
  belongs_to :user


end
