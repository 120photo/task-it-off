class Task < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :list, dependent: :destroy
end
