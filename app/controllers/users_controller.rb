class UsersController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update]
	before_action :correct_user, only: [:edit, :update]	
  def show
	  @user = User.find(params[:id])
	  @micropsts = @user.microposts.order(created_at: :desc)
  end

  def new
	  @user = User.new
  end

  def create
	  @user = User.new(user_params)
	  if @user.save
		  redirect_to @user
	  else
		  render 'new'
	  end
  end
  
  def edit
	  @user = User.find(params[:id]) 
  end

  def update
	@user = User.find(params[:id]) 
	
	if @user.update(user_params)
		redirect_to @user , notice: '変更内容を更新しました'
	else
		render 'edit'
	end

         
  end


  private

  def user_params
	  params.require(:user).permit(:name, :email, :region, :password,
				      :password_confirmation)
  end
  
  def correct_user
	  redirect_to @user if @user != current_user
  end
  
  def set_user
	  @user = User.find(params[:id])
  end




 end
