class Admin::AccountController < AdminController
  def index
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      bypass_sign_in(@user)
      redirect_to admin_account_path, notice: 'Account has been updated 🤗'
    else
      redirect_to admin_account_path, alert: "Errors! #{@user.errors.full_messages.join(', ')}"
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
