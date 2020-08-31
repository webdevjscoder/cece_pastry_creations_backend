class LineItemsController < ApplicationController

  def index
    line_items = LineItem.all
    options = {
        include: [:product]
    }
    render json: LineItemSerializer.new(line_items)
  end

  def show
    line_item = LineItem.find_by_id(params[:id])
    options = {
        include: [:product]
    }
    render json: LineItemSerializer.new(line_item)
  end
end
