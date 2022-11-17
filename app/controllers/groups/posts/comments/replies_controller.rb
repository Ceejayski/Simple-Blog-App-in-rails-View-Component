class Groups::Posts::Comments::RepliesController < ApplicationController
  before_action :set_groups_posts

  def new
    @replies = @replies.build
    # authorize @reply
  end

  def create
    @reply = @replies.build(reply_params)
    @reply.author = current_user
    authorize @reply
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

  def reply_params
    params.require(:reply).permit(:content)
  end
end
