class UsersController < ApplicationController
    before_action :authenticate_user, only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        # binding.pry
        # if current_user.admin == false
        #     if current_user != @user
        #         redirect_to root_path
        #     end
        # end
    end

    # def destroy
    #     @user = User.find(params[:id])
    #     @user.destroy
    #     redirect_to root_path
    # end

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :height, :tickets, :admin)
    end



end 

