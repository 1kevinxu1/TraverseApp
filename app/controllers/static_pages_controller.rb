class StaticPagesController < ApplicationController

  def root
    if current_user
      render :root
    else
      render 'sessions/new'
    end
  end

end
