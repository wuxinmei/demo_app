class User < ActiveRecord::Base
  attr_accessible :email, :name
  validate :name, :presence =>true
end
