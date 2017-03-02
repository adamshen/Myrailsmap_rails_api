class Api::ArticlesController < ApplicationController
  before_action :authenticate_api_user!, only: :create

  def create
    requires! :topic, :title, :content

    topic = ArticleTopic.find_by_name!(params[:topic])
    article = topic.articles.create!(article_params)
    render json: { id: article.id }
  end

  def show
    article = Article.find(params[:id])
    render json: article
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
