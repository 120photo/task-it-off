class Task < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :list, dependent: :destroy

  ratings = [1,2,3]
end
