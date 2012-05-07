class Face < ActiveRecord::Base
  attr_accessible :email, :url

  validates_uniqueness_of :email
  validates_presence_of   :email
  
  def self.create_or_find(email)
    Face.where(:email => email).first||Face.create_with_email(email)
  end

  def self.create_with_email(email)
    url = Email2Face.face(email)
    if url == "I couldn't find a face for that email :(" || url ==  "I couldn't find a face for that email :(. It's also possible that Facebook has asked for a security check on that account, which means that you should sign in and perform the security check."
      face = Face.create(:email => email, :url => nil)
    else
      face = Face.create(:email => email, :url => url)
    end
  end

end
