class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :lockable, :omniauthable

  has_many :connections, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  validate :avatar_size

  def establish_connection(auth)
    return nil unless auth

    connection = connections.find_or_initialize_by(provider: auth['provider'])
    connection.uid = auth['uid']
    connection.info_name = auth['info']&.[]('name')
    connection.info_image = auth['info']&.[]('image')
    connection.save
    connection
  end

  def destroy_connection(provider)
    connections.find_by(provider: provider).try(:destroy)
  end

  private

  def avatar_size
    errors.add(:avatar, '不能大于 2MB') if avatar.size > 2.megabytes
  end
end
