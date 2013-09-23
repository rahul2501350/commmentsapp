class StaticPagesController < ApplicationController
  def home
  	@user = current_user
    render :layout => "homepagelayout" and return
  	respond_to do |format|
      format.html # index.html.erb
      format.js
    end  
  end

  def about
  end

  def contact
  end

  def faq
  end

  def signup
    render :layout => "signuplayout"
  end
end
