class Groups::Posts::CommentsController < ApplicationController
  before_action :set_groups_posts

  def new
    @comment = @comments.build
  end

  def create
    @comment = @comments.build(comment_params)
    @comment.user = current_user
    authorize @comment
    respond_to do |format|
      if @comment.save
        format.html { redirect_to group_post_path(@group, @post), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = @comments.find(params[:id])
    authorize @comment
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to group_post_path(@group, @post), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
    @comment = @comments.find(params[:id])
  end

  def update
    @comment = @comments.find(params[:id])
    authorize @comment
    @comment.update(comment_params)
    respond_to do |format|
      format.html { redirect_to group_post_path(@group, @post), notice: 'Comment was successfully updated.' }
      format.json { render :show, status: :ok, location: @comment }
    end
  end

  private

  def set_groups_posts
    @group = Group.find(params[:group_id])
    @group_posts = @group.posts
    @post = @group_posts.find(params[:post_id])
    @comments = @post.comments.includes(:user, :post, :replies)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
