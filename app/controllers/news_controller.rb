class NewsController < ApplicationController
  def index
    @news = News.all
  end

  def show
    @news = News.all
    @news = News.find(params[:id])
  end

end