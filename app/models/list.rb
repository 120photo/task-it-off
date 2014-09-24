class List < ActiveRecord::Base
  belong_to :user
  has_many :tasks
end
