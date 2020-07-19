class GeneralConfigsController < ApplicationController
  before_action :set_general_config, only: [:show, :edit, :update, :destroy]

  # GET /general_configs
  # GET /general_configs.json
  def index
    @general_configs = GeneralConfig.all
  end

  # GET /general_configs/1
  # GET /general_configs/1.json
  def show
  end

  # GET /general_configs/new
  def new
    @general_config = GeneralConfig.new
  end

  # GET /general_configs/1/edit
  def edit
  end

  # POST /general_configs
  # POST /general_configs.json
  def create
    @general_config = GeneralConfig.new(general_config_params)

    respond_to do |format|
      if @general_config.save
        format.html { redirect_to @general_config, notice: 'General config was successfully created.' }
        format.json { render :show, status: :created, location: @general_config }
      else
        format.html { render :new }
        format.json { render json: @general_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /general_configs/1
  # PATCH/PUT /general_configs/1.json
  def update
    respond_to do |format|
      if @general_config.update(general_config_params)
        format.html { redirect_to @general_config, notice: 'General config was successfully updated.' }
        format.json { render :show, status: :ok, location: @general_config }
      else
        format.html { render :edit }
        format.json { render json: @general_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /general_configs/1
  # DELETE /general_configs/1.json
  def destroy
    @general_config.destroy
    respond_to do |format|
      format.html { redirect_to general_configs_url, notice: 'General config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_general_config
      @general_config = GeneralConfig.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def general_config_params
      params.require(:general_config).permit(:landing_vimeo_id, :active)
    end
end
