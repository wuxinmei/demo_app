require 'digest'
class User < ActiveRecord::Base

  attr_accessor :password
  attr_accessible :email, :name ,:password,:password_confirmation

  email_regex = /\A[\w+\-.]+@[a-z+\d\-.]+\.[a-z]+\z/i

  validates :name, :presence=>true, :length=> { :maximum=>50 }

  validates :email, :presence=>true, :format=>   {:with=>email_regex}, :uniqueness=>{:case_sensitive=>false }
             validates :password, :presence=>true, :confirmation=>true,  
:length => {:within=> 6..40}

before_save :do_encrypt_password
 def has_password?(submitted_password)
 encrypt_password==encrypt(submitted_password)
 end
 
def self.authenticate(email,submitted_password)
    user= find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
    return nil
end

 private
 def do_encrypt_password
     self.encrypt_password = encrypt(password)
 end 
 
def encrypt(string)
  Digest::SHA2.hexdigest(string)
end
end
