class UndercommentsController < ApplicationController
  before_action :set_undercomment, only: [:show, :edit, :update, :destroy]

  # GET /undercomments
  # GET /undercomments.json
  def index
    @undercomments = Undercomment.all
  end

  # GET /undercomments/1
  # GET /undercomments/1.json
  def show
  end

  # GET /undercomments/new
  def new
    @undercomment = Undercomment.new
  end

  # GET /undercomments/1/edit
  def edit
  end

  # POST /undercomments
  # POST /undercomments.json
  def create
    @undercomment = Undercomment.new(undercomment_params)

    respond_to do |format|
      if @undercomment.save
        format.html { redirect_to @undercomment, notice: 'Undercomment was successfully created.' }
        format.json { render :show, status: :created, location: @undercomment }
      else
        format.html { render :new }
        format.json { render json: @undercomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /undercomments/1
  # PATCH/PUT /undercomments/1.json
  def update
    respond_to do |format|
      if @undercomment.update(undercomment_params)
        format.html { redirect_to @undercomment, notice: 'Undercomment was successfully updated.' }
        format.json { render :show, status: :ok, location: @undercomment }
      else
        format.html { render :edit }
        format.json { render json: @undercomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /undercomments/1
  # DELETE /undercomments/1.json
  def destroy
    @undercomment.destroy
    respond_to do |format|
      format.html { redirect_to undercomments_url, notice: 'Undercomment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_undercomment
      @undercomment = Undercomment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def undercomment_params
      params.require(:undercomment).permit(:content)
    end
end
