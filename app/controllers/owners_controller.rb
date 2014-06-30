class OwnersController < ApplicationController
  def new

  end
  def create

  end

  def show
    @owner = Owner.find(params[:id])
  end

end