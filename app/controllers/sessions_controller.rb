class SessionsController < ActionController::Base
  def new
    @session = []
  end

  def create
    # @user = User.find_by(username: params[:username])
    if User.authenticate(params[:username],params[:password])
      @user = User.find_by(username: params[:username])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def delete
    session.clear
    p session[:user_id]
    redirect_to root_path
  end


  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
