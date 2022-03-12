class Api::V1::FactsController < ApplicationController
	before_action :find_fact, only: [:show, :update, :destroy]

	def index
		@facts = Fact.all
		render json: @facts
	end

	def show
		render json: @fact
	end

	def create
		@fact = Fact.new(fact_params)
		if @fact.save
			render json: @fact
		else
			render error: {error: "unable to create fact"}, status: 400
		end
	end

	def update
		@fact = Fact.where(params[:id])
		if @fact.update
			render json: {message: "successfully updated fact"}, status: 200
		else
			render json: {message: "unable to update record"}, status: 400
		end
	end


	def destroy
		@fact = Fact.where(params[:id])
		if @fact.destroy
			render json: {message: "successfully deleted fact"}, status: 200
		else

			render json: {message: "unable to delete fact"}, status: 400
		end
	end

	private

	def fact_params
		params.require(:fact).permit(:fact, :likes, :user_id)
	end

	def find_fact
		@fact = Fact.where(params[:id])
	end


end
