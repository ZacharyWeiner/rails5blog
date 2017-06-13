class PortfoliosController < ApplicationController
  before_action :portfolio_params, only: [:show, :edit, :update, :destroy]
  layout 'portfolio'
  def index
    @portfolio_items = Portfolio.all 
  end

  def angular
    @portfolio_items = Portfolio.angular
  end 

  def new 
    @portfolio_item = Portfolio.new
    3.times {@portfolio_item.technologies.build} 
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
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
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

  def portfolio_params
      @portfolio_item = params.require(:portfolio).permit(:title, 
        :subtitle, 
        :body,
        :image, 
        technologies_attributes: [:name]
        )
    end
end
