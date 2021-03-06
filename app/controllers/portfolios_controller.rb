require 'byebug'
class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  layout 'portfolio'
  access all: [:show, :index, :angular], user: {except: [:sort, :destroy, :new, :create, :update, :edit]}, site_admin: :all 

  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort 
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end
    render nothing: true
  end 

  def angular
    @portfolio_items = Portfolio.angular
  end 

  def new 
    @portfolio_item = Portfolio.new
  end

  def create 
    @portfolio_item = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_item.save 
        format.html{redirect_to portfolios_path, notice: "You created a new item"}
      else 
        format.html{ render :new}
      end
    end 
  end 

  def edit 
      
  end 

  def update
     respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end 

  def show
   
  end 

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end 

  def set_portfolio
    @portfolio_item = Portfolio.find(params[:id])
  end 

  def portfolio_params
     params.require(:portfolio).permit(:title, 
        :subtitle, 
        :body,
        :image,
        :thumb_image, 
        technologies_attributes: [:name, :id, :_destroy]
        )
    end
end
