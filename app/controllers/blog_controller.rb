class BlogController < ApplicationController
  before_action :move_to_index, except: [:top, :index, :show]

  def top
    render layout: false
  end

  def index
    @articles = Article.includes(:user).order("created_at desc").page(params[:page]).per(2)
  end

  def new
  end

  def create
    Article.create(title: article_params[:title], image: article_params[:image], text: article_params[:text], user_id: current_user.id)
    redirect_to :action => "index"
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy if article.user_id == current_user.id
    redirect_to :action => "index"
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.update(article_params)
    end
    redirect_to :action => "index"
  end

  def show
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.permit(:title, :image, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
