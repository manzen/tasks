class SectionsController < ApplicationController
  before_action :authenticate
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  # GET /sections
  # GET /sections.json
  def index
    @sections = Section.all

    if params[:id].present?
      set_priority
    else
      @section = Section.new
    end
  end

  # GET /sections/new
  def new
    @section = Section.new
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to sections_path, notice: "#{@section.name}を作成しました。" }
        format.json { render :show, status: :created, location: @section }
      else
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to @section, notice: "#{@section.name}を更新しました。"  }
        format.json { render :show, status: :ok, location: @section }
      else
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    name = @section.name
    @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_url, notice: "#{name}を削除しました。" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:name)
    end

    def authenticate
      redirect_to '/users/sign_in' unless user_signed_in?
    end

end
