class PagesController < ApplicationController

	before_filter RubyCAS::GatewayFilter

  def home
  end
  
  def about
  end
  
  def contact
  end
end