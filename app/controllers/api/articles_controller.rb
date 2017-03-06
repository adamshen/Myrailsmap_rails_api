class Api::ArticlesController < ApplicationController
  before_action :authenticate_api_user!, only: :create

  def create
    requires! :article_topic_id, :title, :content

    article = topic.articles.create!(article_params)
    render json: { id: article.id }
  end

  def show
    article = Article.find(params[:id])
    render json: article
  end

  def update
    requires! :article_topic_id, :title, :content

    article = Article.find(params[:id])
    article.article_topic = topic
    article.update(article_params)

    render json: { id: article.id }
  end

  def index
    # Todo: page & group
    articles = Article.all.select(:id, :title)
    render json: articles
  end

  private
  def topic
    ArticleTopic.find(params[:article_topic_id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
