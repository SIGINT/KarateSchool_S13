class HomeController < ApplicationController
  skip_before_filter :check_login
  
  def index
  end

  def about
  end

  def contact
  end

  def privacy
  end

  def search
  end
end
