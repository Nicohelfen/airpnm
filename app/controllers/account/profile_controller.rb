module Account
  class ProfileController < ApplicationController

    def show
    end

    def edit
      @profile = current_user
    end

    def update
      @profile = current_user
      if @profile.update(params_whitelist)
        flash[:notice] = "Your profile has been updated"
        redirect_to account_profile_path
      else
        flash[:alert] = "Your profile has not been updated? Please try again"
        render :edit
      end
    end

    private
    def params_whitelist
      params.require(:user).permit(:first_name, :last_name, :email, :picture)
    end
  end
end
