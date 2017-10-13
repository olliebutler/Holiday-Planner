class UnavalibilitiesController < ApplicationController
  before_action :set_unavalibility, only: [:show, :edit, :update, :destroy]

  # GET /unavalibilities
  # GET /unavalibilities.json
  def index
    @unavalibilities = Unavalibility.all
  end

  # GET /unavalibilities/1
  # GET /unavalibilities/1.json
  def show
  end

  # GET /unavalibilities/new
  def new
    @unavalibility = Unavalibility.new
  end

  # GET /unavalibilities/1/edit
  def edit
  end

  # POST /unavalibilities
  # POST /unavalibilities.json
  def create
    @unavalibility = Unavalibility.new(unavalibility_params)

    respond_to do |format|
      if @unavalibility.save
        format.html { redirect_to @unavalibility, notice: 'Unavalibility was successfully created.' }
        format.json { render :show, status: :created, location: @unavalibility }
      else
        format.html { render :new }
        format.json { render json: @unavalibility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unavalibilities/1
  # PATCH/PUT /unavalibilities/1.json
  def update
    respond_to do |format|
      if @unavalibility.update(unavalibility_params)
        format.html { redirect_to @unavalibility, notice: 'Unavalibility was successfully updated.' }
        format.json { render :show, status: :ok, location: @unavalibility }
      else
        format.html { render :edit }
        format.json { render json: @unavalibility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unavalibilities/1
  # DELETE /unavalibilities/1.json
  def destroy
    @unavalibility.destroy
    respond_to do |format|
      format.html { redirect_to unavalibilities_url, notice: 'Unavalibility was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unavalibility
      @unavalibility = Unavalibility.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unavalibility_params
      params.require(:unavalibility).permit(:name, :start_time, :end_time, :group_id, :message)
    end
end
