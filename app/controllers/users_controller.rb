class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: user
    end
    
    def create
        user = User.create(user_params)
        if user
            render json: user
          else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end

    def destroy
        user = user.find(params[:id])
        user.destroy
        render json: user
    end
end

private

def user_params
    params.require(:user).permit(:id, :email, :username, :password)
end
