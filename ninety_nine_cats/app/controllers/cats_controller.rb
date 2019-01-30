class CatsController < ApplicationController

  def index 
    @cats = Cat.all

    # render 'index', cats: @cats
  end 

  def show
    @cat = Cat.find(params[:id])
    # render 'show', cat: @cat
  end

  def new
    @cat = Cat.new
    render 'new'    
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save!
      redirect_to cat_url(@cat)
    else 
      render @cat.errors.full_message, status: :unprocessable_entity
    end 
  end 

  def edit 
    @cat = Cat.find(params[:id])

    render 'update'
  end 

  def update 

    @cat = Cat.find(params[:id])

    if @cat.persisted? 
      Cat.update(params[:id], cat_params)
      redirect_to cat_url(@cat)
    else 
      render @cat.errors.full_message, status: :not_found
    end 
  end 
  private

  def cat_params
    params.require(:cat).permit(:name, :birth_date, :sex, :color, :description)
  end 
end 