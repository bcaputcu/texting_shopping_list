class ItemsController < ApplicationController

	def index
		@current_list = Item.current_list
		@bought = Item.bought
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(params[:item])

		respond_to do |format|
			if @item.save
				format.html { redirect_to items_path, notice: "Item successfully created!" }
			else
				format.html { render 'new' }
			end
		end
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])

		respond_to do |format|
			if @item.update_attributes(params[:item])
				format.html { redirect_to items_path, notice: "#{@item.name} was successfully updated." }
				format.json { head :no_content }
				format.js
			else
				format.html { render action: "edit" }
				format.json { render json: @item.errors, status: :unprocessable_entity }
			end
		end
	end

end
