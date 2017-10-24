class NewsController < ApplicationController
  before_action :authenticate
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  # GET /news
  # GET /news.json
  def index
    @all_news = News.all

    if params[:id].present?
      set_news
    else
      @news = News.new
    end
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    @news = News.new(news_params)
    @news.user = current_user

    respond_to do |format|
      if @news.save
        format.html { redirect_to news_index_url, notice: "#{@news.url}を作成しました。" }
      else
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to request.referer, notice: "#{@news.url}を更新しました。" }
        format.json { render :show, status: :ok, location: @news }
      else
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    url = @news.url
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_url, notice: "#{url}を削除しました。" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:url, :delete_flg, :user_id, :section_id)
    end

    def authenticate
      redirect_to '/users/sign_in' unless user_signed_in?
    end

end
