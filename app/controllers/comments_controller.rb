class CommentsController < ApplicationController
  def index
  end

  def list
    list = []
    Comment.all.each do |c|
      list << {
          author: c.title,
          text:   c.body
      }
    end

    render :json => list
  end

  def post
    c       = Comment.new
    c.title = params[:author]
    c.body  = params[:text]
    c.save!

    render :json => {
               author: c.title,
               text:   c.body
           }
  end
end
