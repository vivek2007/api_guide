class Api::V1::UsersController < ApplicationController



	def index
		@users = User.all
		render json: @users
	end

	def show
		@user = User.where(params[:id])
		render json: @user
	end

	def create
		@user = User.new(user_params)
		if @user.save
			render json: @user
		else
			render error: {error: "unable to create user"}, status: 400
		end
	end

	def update
		@user = User.where(params[:id])
		if @user
			@user.update(user_params)
			render json: {message: "User successfully updated"}, status: 200
		else
			render json: {error: "Unable to update user"}, status: 400
		end
	end

	def destroy
		@user = User.where(params[:id])
		if @user.destroy
			render json: {message: "User successfully deleted"}, status: 200
		else
			render json: {error: "Unable to delete user"}, status: 400
		end
	end


	private

	def user_params
		params.require(:user).permit(:username, :passowrd)
	end





end
