class Groups::Posts::Comments::RepliesController < ApplicationController
  before_action :set_groups_posts

  def new
    @replies = @replies.build
  end

  def create
    @reply = @replies.build(body: params[:body])
    @reply.user = current_user
    @reply.post = @post
    respond_to do |format|
      if @reply.save
        format.html { redirect_to group_post_path(@group, @post), notice: 'Reply was successfully created.' }
        format.json { render :show, status: :created, location: @reply }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_groups_posts
    @group = Group.find(params[:group_id])
    @group_posts = @group.posts
    @post = @group_posts.find(params[:post_id])
    @comments = @post.comments
    @comment = @comments.find(params[:comment_id])
    @replies = @comment.replies
  end
end
