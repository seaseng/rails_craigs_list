class UsersController < ApplicationController

  # get, show a list of all users
  def index 
    @users = User.all
  end

  # get, get view for new user to fill out
  # GET /users/new
  def new
    @user = User.new
  end

  # post, save new user data to database
  def create
    @user = User.new(params[:user])
    redirect_to @user if @user.save
  end

  def login 
    # puts params
    user = User.create(params[:user])
    if user.valid?
      session[:user_id] = user.id
      redirect_to "/user/#{session[:user_id]}"
    else
      # puts "Errors: #{user.errors.full_messages}"
      # @error_messages = user.errors.full_messages
      # erb :'/user/user_new'

    end
  end

  # def edit

  # end

  # PUT /users/:id
  # def update

  # end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
  end

  

  # DELETE /users/:id
  # def destroy

  # end




end
