class TroubelsController < ApplicationController
  before_action :set_troubel, only: [:show, :edit, :update, :destroy]

  # GET /troubels
  # GET /troubels.json
  def index
    @troubels = Troubel.all
  end

  # GET /troubels/new
  def new
    @troubel = Troubel.new
  end

  # GET /troubels/1/edit
  def edit
  end

  # POST /troubels
  # POST /troubels.json
  def create
    @troubel = Troubel.new(troubel_params)

    respond_to do |format|
      if @troubel.save
        format.html { redirect_to troubels_path, notice: 'Permasalahan berhasil di simpan' }
        format.json { render :show, status: :created, location: @troubel }
      else
        format.html { render :new }
        format.json { render json: @troubel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /troubels/1
  # PATCH/PUT /troubels/1.json
  def update
    respond_to do |format|
      if @troubel.update(troubel_params)
        format.html { redirect_to @troubel, notice: 'Permasalahan berhasil di perbarui' }
        format.json { render :show, status: :ok, location: @troubel }
      else
        format.html { render :edit }
        format.json { render json: @troubel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /troubels/1
  # DELETE /troubels/1.json
  def destroy
    @troubel.destroy
    respond_to do |format|
      format.html { redirect_to troubels_url, notice: 'Permasalahan berhasil di hapus' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_troubel
      @troubel = Troubel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def troubel_params
      params.fetch(:troubel).permit(:name, :grade, :price)
    end
end
