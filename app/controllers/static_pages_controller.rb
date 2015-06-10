class StaticPagesController < ApplicationController
  before_action :require_user
  def root
    render :root
  end

end
