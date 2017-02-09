class KategorisController < ApplicationController
  before_action :set_kategori, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /kategoris
  # GET /kategoris.json
  def index
    @kategoris = Kategori.all.order ("nama asc")
  end

  # GET /kategoris/1
  # GET /kategoris/1.json
  def show
    @stoks = @kategori.stoks.page(params[:page]).per(8)
  end

  # GET /kategoris/new
  def new
    @kategori = Kategori.new
    @stoks = @kategori.stoks
  end

  # GET /kategoris/1/edit
  def edit
  end

  # POST /kategoris
  # POST /kategoris.json
  def create
    @kategori = Kategori.new(kategori_params)
    @stoks = @kategori.stoks
    respond_to do |format|
      if @kategori.save
        format.html { redirect_to '/kategoris', flash: { success: "Kategori #{@kategori.nama} berhasil di buat." } }
        format.json { render :show, status: :created, location: @kategori }
      else
        format.html { render :new }
        format.json { render json: @kategori.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kategoris/1
  # PATCH/PUT /kategoris/1.json
  def update
    respond_to do |format|
      if @kategori.update(kategori_params)
        format.html { redirect_to '/kategoris', flash: { success: "Kategori #{@kategori.nama} berhasil di perbarui." } }
        format.json { render :show, status: :ok, location: @kategori }
      else
        format.html { render :edit }
        format.json { render json: @kategori.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kategoris/1
  # DELETE /kategoris/1.json

  def destroy
    @kategori.destroy
    respond_to do |format|
      format.html { redirect_to kategoris_url, notice: "Kategori #{@kategori.nama} berhasil di hapus." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kategori
      @kategori = Kategori.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kategori_params
      params.require(:kategori).permit(:gambar, :nama, :deskripsi)
    end
end
