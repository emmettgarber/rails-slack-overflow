class UsersController < ActionController::Base
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))
    if @user.save
      redirect_to "/sessions/login"
    else
      render 'new'
    end
  end

end
