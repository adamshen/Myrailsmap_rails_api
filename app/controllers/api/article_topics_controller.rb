class Api::ArticleTopicsController < ApplicationController
  def index
    render json: ArticleTopic.all
  end
end
