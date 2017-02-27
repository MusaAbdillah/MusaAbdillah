class StoksController < ApplicationController
  before_action :set_stok, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /stoks
  # GET /stoks.json
  def index
    @search = Stok.search(params[:q])
    @stoks = @search.result.page(params[:page]).per(12).order("nama asc")
    @order_item = current_order.order_items.new
  end

  # GET /stoks/1
  # GET /stoks/1.json
  def show
  end

  # GET /stoks/new
  def new
    @stok = Stok.new
    @kategori = @stok.kategori
  end

  # GET /stoks/1/edit
  def edit
  end

  # POST /stoks
  # POST /stoks.json
  def create
    @stok = Stok.new(stok_params)

    respond_to do |format|
      if @stok.save(stok_params)
        format.html { redirect_to @stok, flash: { success: "Produk #{@stok.nama} berhasil di buat." }}
        format.json { render :show, status: :created, location: @stok }
      else
        format.html { render :new }
        format.json { render json: @stok.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stoks/1
  # PATCH/PUT /stoks/1.json
  def update
    respond_to do |format|
      if @stok.update(stok_params)
        format.html { redirect_to @stok, notice: "Produk #{@stok.nama} berhasil di perbarui." }
        format.json { render :show, status: :ok, location: @stok }
      else
        format.html { render :edit }
        format.json { render json: @stok.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stoks/1
  # DELETE /stoks/1.json
  # non aktifkan method destroy
  def destroy
    @stok.destroy
    respond_to do |format|
      format.html { redirect_to @stok, flash: { error: "Produk #{@stok.nama} berhasil di hapus." }}
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stok
      @stok = Stok.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stok_params
      params.fetch(:stok).permit(:gambar, :nama, :harga_beli, :harga_jual, :jumlah, :kategori_id)
    end
end
