class UsersController < ApplicationController

  before_action :signing_required, except: [:create, :new]
  
  before_action :require_correct_user, only: [:edit, :update, :destroy]

  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @registrations = @user.registrations
    @liked_events = @user.liked_events
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      
      redirect_to @user,notice:"User created successfully"
      session[:user_id] = @user.id
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    
    if @user.update(user_params)
      redirect_to @user, notice:"update successfully"
    else
      render :edit
    end

  end

  def destroy
    
    session[:user_id] = nil
    @user.destroy
    redirect_to events_url, alert: "successfully deleted"
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def require_correct_user
      @user = User.find(params[:id])
      redirect_to events_url unless current_user?(@user)
        
      
    end


end
