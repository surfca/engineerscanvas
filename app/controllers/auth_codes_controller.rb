class AuthCodesController < ApplicationController
  before_action :authenticate_admin!
  require 'digest/md5'

  def new
    if super_admin?
      @all_admins = Admin.all.map {|a| [a.name,a.id]}
      @auth_code = AuthCode.new
    end
  end

  def create
    if super_admin?
      @code = generate_code
      @auth_code = AuthCode.new(code: @code, admin_id: params[:certify_admin_id])
      if @auth_code.save?
        @certified_admin = Admin.find(params[:certify_admin_id])
        render template: auth_codes/show_code
      else
        flash[:notice] = "something went wrong in code generation"
        render new
      end
    end
  end

  private

  def super_admin?
    (current_admin.email == 'sowju19@gmail.com')
  end

  def generate_code
    my_code = Digest::MD5.hexdigest Time.now.to_i.to_s
    my_code[2..10]
  end
end