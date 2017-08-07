class Connection < ApplicationRecord
  belongs_to :user

  ALLOW_PROVIDERS = ['facebook'].freeze

  validates :provider, inclusion: { in: ALLOW_PROVIDERS }
end
