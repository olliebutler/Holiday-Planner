class UnavailabilitiesController < ApplicationController

  before_action :set_unavailability, only: [:show, :edit, :update, :destroy]

  # GET /unavailabilities
  # GET /unavailabilities.json
  def index
    @unavailabilities = Unavailability.all
  end

  # GET /unavailabilities/1
  # GET /unavailabilities/1.json
  def show
  end

  # GET /unavailabilities/new
  def new
    @unavailability = Unavailability.new
  end

  # GET /unavailabilities/1/edit
  def edit
  end

  # POST /unavailabilities
  # POST /unavailabilities.json
  def create
    @unavailability = Unavailability.new(unavailability_params)
    if @unavailability.group_id == nil || ""
      @unavailability.group_id = params[:group_id]
    end
    if @unavailability.start_time < @unavailability.end_time || @unavailability.start_time.to_date === @unavailability.end_time.to_date
      @unavailability.name = params[:name]
      respond_to do |format|
        if @unavailability.save
          format.html { redirect_to Group.find(params[:group_id]), notice: 'Unavailability was successfully created.' }
          format.json { render :show, status: :created, location: @unavailability }
        else
          format.html { render :new }
          format.json { render json: @unavailability.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to Group.find(params[:group_id]), alert: 'Start date cannot be after end date.'
    end

  end


  # PATCH/PUT /unavailabilities/1
  # PATCH/PUT /unavailabilities/1.json
  def update
    respond_to do |format|
      if @unavailability.update(unavailability_params)
        format.html { redirect_to @unavailability, notice: 'Unavailability was successfully updated.' }
        format.json { render :show, status: :ok, location: @unavailability }
      else
        format.html { render :edit }
        format.json { render json: @unavailability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unavailabilities/1
  # DELETE /unavailabilities/1.json
  def destroy
    @unavailability.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Unavailability was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unavailability
      @unavailability = Unavailability.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unavailability_params
      params.require(:unavailability).permit(:name, :start_time, :end_time, :message, :group_id, :user_id)
    end
end
