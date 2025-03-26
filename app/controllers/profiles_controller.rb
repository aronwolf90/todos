class ProfilesController < ApplicationController
  def show
  end

  def destroy
    Current.user.destroy!

    redirect_to root_path, status: :see_other, notice: "All your data was successfully destroyed."
  end
end
