class AuthCodesController < ApplicationController
  before_action :authenticate_admin!
  require 'digest/md5'

  def new
    if super_admin?
      @all_admins = Admin.all
      @auth_code = AuthCode.new
    end
  end

  def create
    if super_admin?
      my_code = Digest::MD5.hexdigest
    end
  end

  private

  def super_admin?
    (current_admin.email == 'sowju19@gmail.com')
  end
end