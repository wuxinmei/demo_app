class PagesController < ApplicationController
  def home
    @title="Home"
  end

  def about
    @title="about"
  end

  def contact
    @title="contact"
  end
end
