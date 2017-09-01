class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  def home
  end

  def about
  end

  def contact
  end

  def secret
    # this will be just for testing devise
  end
end
