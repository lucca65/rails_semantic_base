module Api
  class UsersController < ApiController
    def create

    end

    def sign_in
      user_params = sign_in_params
      @user = User.find_by_email(user_params["email"])
      if @user.nil?
        return render(:not_found, status: :not_found)
      end

      respond_to do |format|
        binding.pry
        if @user.sign_in(user_params)
          @user.update_last_signin
          format.json { render :create, status: :ok }
        else
          format.json { render :error, status: :unprocessable_entity }
        end
      end
    end

    private

    def sign_in_params
      params.require(:user)
        .permit(:email, :password)
    end
  end
end
