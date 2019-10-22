class StaticPageController < ApplicationController
  def index
    @user = current_user
  end

  def about
  end

  def help
  end

  def contact
  end
end
