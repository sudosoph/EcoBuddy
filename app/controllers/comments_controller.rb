class CommentsController < ApplicationController
  before_action :get_article
  before_action :get_comment, except: [ :index, :create ]

  def index
    article = Article.includes(:comments).find(params[:article_id])
    comments = article.comments

    render json: comments.to_json(
      include: [
        article: {
          only: [ :title ]
        }
      ],
      except: [ :updated_at ]
    )
  end

  def show
    render json: comment.to_json(
      include: [
        article: {
          only: [ :title ]
        }
      ],
      except: [ :updated_at ]
    )
  end

  def create
  end

  def update
  end

  def destroy
    @comment.destroy
  end

private

  def get_article
    @article = Article.includes(:comments).find(params[:article_id])
  end

  def get_comment
    @comment = @article.comments.find(params[:id])
  end

end
