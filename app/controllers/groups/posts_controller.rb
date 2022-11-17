class Groups::PostsController < ApplicationController
  before_action :set_groups_post
  before_action :set_post, only: %i[show edit update destroy]

  # GET /groups/posts or /groups/posts.json

  # GET /groups/posts/1 or /groups/posts/1.json
  def show
    authorize @post
  end

  # GET /groups/posts/new
  def new
    @post = @group_post.build
  end

  # GET /groups/posts/1/edit
  def edit; end

  # POST /groups/posts or /groups/posts.json
  def create
    @groups_post = @groups_posts.build(groups_post_params)
    authorize @groups_post
    respond_to do |format|
      if @groups_post.save
        format.html { redirect_to groups_post_url(@groups_post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @groups_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @groups_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/posts/1 or /groups/posts/1.json
  def update
    authorize @post

    respond_to do |format|
      if @post.update(groups_post_params)
        format.html { redirect_to groups_post_url(@groups_post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @groups_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @groups_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/posts/1 or /groups/posts/1.json
  def destroy
    authorize @post

    @post.destroy

    respond_to do |format|
      format.html { redirect_to groups_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_groups_posts
    @group = Group.find(params[:group_id])
    @groups_posts = @group.posts
  end

  def set_post
    @post = @group_post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def groups_post_params
    params.require(:groups_post).permit(:title, :description)
  end
end
