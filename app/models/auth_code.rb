class AuthCode < ActiveRecord::Base
  belongs_to :admin

  def uncertify!
    self.code = nil
    save!
  end
end