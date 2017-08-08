class Connection < ApplicationRecord
  belongs_to :user

  ALLOW_PROVIDERS = ['facebook', 'github'].freeze

  validates :provider, inclusion: { in: ALLOW_PROVIDERS }

  def self.find_by_omniauth(auth)
    find_by(provider: auth.provider, uid: auth.uid)
  end
end
