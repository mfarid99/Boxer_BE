class FightersController < ApplicationController
  before_action :set_fighter, only: [:show, :update, :destroy]
  before_action :authorized
  
  # GET /fighters
  def index
    @fighters = Fighter.find_by user: @user.id

    render json: @fighters
  end

  # GET /fighters/1
  def show
    render json: @fighter
  end

  # POST /fighters
  def create
    @fighter = Fighter.new(fighter_params)
    @fighter.user = @user.id

    if @fighter.save
      render json: @fighter, status: :created, location: @fighter
    else
      render json: @fighter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fighters/1
  def update
    if @fighter.update(fighter_params)
      render json: @fighter
    else
      render json: @fighter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fighters/1
  def destroy
    @fighter.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fighter
      @fighter = Fighter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fighter_params
      params.require(:fighter).permit(:name, :photo, :weightclass, :wins, :losses, :titles, :about, :user_id)
    end
end
