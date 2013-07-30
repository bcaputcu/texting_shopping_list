class ItemsController < ApplicationController

	def index
		@items = Item.all
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


end
