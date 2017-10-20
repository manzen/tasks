class TasksController < ApplicationController
  before_action :authenticate
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user = current_user
    @task.priority = Priority.find(params[:task][:priority_id])
    @task.section = Section.find(params[:task][:section_id])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "#{@task.name}を作成しました。" }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "#{@task.name}を更新しました。" }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    name = @task.name
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "#{name}を削除しました。" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :deadline, :work_time, :state, :implementation_scheduled_date, :complete_scheduled_date)
    end

    def authenticate
      redirect_to '/users/sign_in' unless user_signed_in?
    end

end
