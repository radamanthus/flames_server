class User < Omnisocial::User
  
  def facebook_user
    @facebook_user ||= FbGraph::User.fetch(self.login_account.remote_account_id, 
      :access_token => self.login_account.access_token)
  end

end
# == Schema Information
#
# Table name: users
#
#  id             :integer         not null, primary key
#  remember_token :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

