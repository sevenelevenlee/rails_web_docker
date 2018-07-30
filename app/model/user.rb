class User < ApplicationRecord

  has_and_belongs_to_many :chats
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  def to_s
    if self.name.present?
      self.name
    else
      self.id.to_s
    end
  end

  def self.search(params)
    User.where("users.name LIKE ?", "%#{params[:query]}%")
  end

  def self.search_friends(params, current_user)
    User.all_except(current_user).all_except(current_user.friends).where("users.name LIKE ?", "%#{params[:query]}%")
  end

  def self.all_except(user)
    where.not(id: user)
  end

end
