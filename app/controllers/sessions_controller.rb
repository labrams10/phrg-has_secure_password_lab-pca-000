# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to new_user_path
  end
end
