class Admin::UsersController < Admin::AdminController

  def index
    @users = User.order('last_name, first_name')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.invite!
      respond_with @user, location: admin_users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:password].blank?
       params[:user].delete("password")
    end
    if @user.update_attributes(user_params)
      respond_with @user, location: admin_users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:admin, :email, :first_name, :last_name, :password)
  end
end
