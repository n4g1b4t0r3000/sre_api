class ProductsController < ApplicationController
  def index
    render json: { message: "List of products" }
  end

  def show
  end
end
