class PrioritiesController < ApplicationController
  before_action :set_priority, only: [:show, :edit, :update, :destroy]

  # GET /priorities
  # GET /priorities.json
  def index
    @priorities = Priority.all

    if params[:id].present?
      set_priority
    else
      @priority = Priority.new
    end
  end

  # GET /priorities/new
  def new
    @priority = Priority.new
  end

  # GET /priorities/1/edit
  def edit
  end

  # POST /priorities
  # POST /priorities.json
  def create
    @priority = Priority.new(priority_params)

    respond_to do |format|
      if @priority.save
        format.html { redirect_to priorities_path, notice: "#{@priority.name}を作成しました。" }
        format.json { render :show, status: :created, location: @priority }
      else
        format.html { render :new }
        format.json { render json: @priority.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /priorities/1
  # PATCH/PUT /priorities/1.json
  def update
    respond_to do |format|
      if @priority.update(priority_params)
        format.html { redirect_to request.referer, notice: "#{@priority.name}を更新しました。" }
        format.json { render :show, status: :ok, location: @priority }
      else
        format.html { render :edit }
        format.json { render json: @priority.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /priorities/1
  # DELETE /priorities/1.json
  def destroy
    name = @priority.name
    @priority.destroy
    respond_to do |format|
      format.html { redirect_to priorities_url, notice: "#{name}を削除しました。" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_priority
      @priority = Priority.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def priority_params
      params.require(:priority).permit(:name)
    end
end
