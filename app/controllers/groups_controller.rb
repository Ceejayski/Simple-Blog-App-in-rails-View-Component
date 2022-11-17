class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  def index
    @query = params[:query] || 'all'

    @queries_details = [{ query: 'all', label: 'All Groups' }, { query: 'membership', label: 'My Groups' },
                        { query: 'created_groups', label: 'Groups I Created' }]

    @groups = Group.build_query(query: @query, user: current_user)
  end

  def show
    authorize @group
    @posts = @group.posts.most_recent
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.created_groups.build(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to group_url(@group), notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy
    redirect_to root_path, notice: 'Group was successfully deleted.'
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:title)
  end
end
