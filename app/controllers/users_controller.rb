class UsersController < ApplicationController
    def index 
        users = User.all 
        render json: users, status: :ok
    end

    def show
        user = User.find(params[:id])
        render json: user, status: :ok
    end

    def create 
        user = User.new(user_params)
        render json: user, status: :ok
    end

    def update
        user = User.find(params[:id])

        if user.update(user_params)
            render json: user, status: :created
        else
            render json: user.errors, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find(params[:id])
        render json: nil, status: :ok
    end

    private

    def user_params
        params.require(:user).permit(:full_name, :email, :age)
    end
end
