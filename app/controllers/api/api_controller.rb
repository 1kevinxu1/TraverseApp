module Api
  class ApiController < ApplicationController
    before_action :require_signed_in!

    def require_signed_in!
      unless current_user
        render json: ["You must be signed in to perform that action!"], status: :unauthorized
      end
    end
  end
