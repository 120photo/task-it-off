class List < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :tasks

  scope :private_list, -> { where(public: false)}
  scope :public_list, -> { where(public: true)}
end
