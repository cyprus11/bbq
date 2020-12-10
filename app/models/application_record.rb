class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def registered_users_emails
    User.all.map(&:email)
  end
end
