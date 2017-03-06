class Api::ArticlesController < ApplicationController
  before_action :authenticate_api_user!, only: :create
  before_action :find_article, only: [:show, :update, :destroy]
  before_action :check_params, only: [:create, :update]

  def create
    article = topic.articles.create!(article_params)
    render json: { id: article.id }
  end

  def show
    render json: @article
  end

  def update
    @article.article_topic = topic
    @article.update(article_params)

    render json: { id: @article.id }
  end

  def index
    # Todo: page & group
    articles = Article.all.select(:id, :title)
    render json: articles
  end

  def destroy
    @article.destroy
    render json: { success: true }
  end

  private
  def find_article
    @article = Article.find(params[:id])
  end

  def check_params
    requires! :article_topic_id, :title, :content
  end

  def topic
    ArticleTopic.find(params[:article_topic_id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
