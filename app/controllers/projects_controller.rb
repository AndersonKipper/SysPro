class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  
  # GET /projects
  # GET /projects.json
  def index
  #  @user = User.find_by_id(session[:user_id])
  #  @projects = @user.projects
  #  @projects = Project.find_by_user_id(session[:user_id])

    @projects = Project.where(:user_id => session[:user_id])


    @user = User.find_by_id(session[:user_id])
    @tasks = Task.where(:user_email => @user.email)
    @tasks.order(dateEnd: :asc)
    @projectsPart = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @forum = Forum.new
    @forum.project_id = @project.id
    @user = User.find_by_id(session[:user_id])
    @forum.user_id = @user.id
    @forum.name_user = @user.nome
  end

  # GET /projects/new
  def new

    @project = Project.new
    @user = User.find_by_id(session[:user_id])
    @project.user_id = @user.id
@u = User.all
  end

  # GET /projects/1/edit
  def edit
    @user = User.find_by_id(session[:user_id])
    @project = Project.find_by_id(params[:id])
    if @user.id != 1 && @user.id != @project.user_id
      redirect_to "404.html"
    end
    @u = User.all
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
       # @project.user_id = session[:current_user_id]
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:nome, :description, :date, :user_id, :stats)
    end
end
