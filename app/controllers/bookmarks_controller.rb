class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  # GET /bookmarks
  def index
    @bookmarks = Bookmark.order(created_at: :desc)  # ← これがないと nil になる
    @bookmark  = Bookmark.new                       # （トップで新規フォームを出すなら）
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to bookmarks_path, notice: "保存しました"
    else
      # 失敗時に index を描画するなら、@bookmarks を必ず用意する
      @bookmarks = Bookmark.order(created_at: :desc)
      render :index, status: :unprocessable_entity
    end
  end

  # 以降は通常どおり
  def show; end
  def edit; end
  def update
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark, notice: "更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path, notice: "削除しました"
  end

  private
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:title, :url, :memo)
  end
end
