class SessionsController < ApplicationController
    wrap_parameters format: []
    def create
        user = User.find_by(username: params[:username])
        session[:user_id] = user.id
        render json: user, status: :ok
    end

    def destroy
        session.delete :user_id
        render json: {}, status: :no_content
    end
end
