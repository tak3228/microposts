class UsersController < ApplicationController 
	before_action :logged_in_user, only: [:edit, :update]	
  def show
	  @user = User.find(params[:id])
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
	  @user = current_user
  end

  def update
	@user = current_user
	
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
  

  





 end
