class ProfilesController < ApplicationController
  before_action :set_breadcrumbs, only: %i[ show ]

  def show
  end

  def destroy
    Current.user.destroy!

    redirect_to root_path, status: :see_other, notice: "All your data was successfully destroyed."
  end

  private
    def set_breadcrumbs
      @breadcrumbs = [
        { title: "Home", path: lists_path }
      ]
    end
end
