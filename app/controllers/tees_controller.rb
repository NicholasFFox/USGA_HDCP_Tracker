class TeesController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # GET /tees
  # GET /tees.json
  def index
    @tees = Tee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tees }
    end
  end

  # GET /tees/1
  # GET /tees/1.json
  def show
    @tee = Tee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tee }
    end
  end

  # GET /tees/new
  # GET /tees/new.json
  def new
    @tee = Tee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tee }
    end
  end

  # GET /tees/1/edit
  def edit
    @tee = Tee.find(params[:id])
  end

  # POST /tees
  # POST /tees.json
  def create
    @tee = Tee.new(params[:tee])

    respond_to do |format|
      if @tee.save
        format.html { redirect_to new_round_path, notice: 'Tee was successfully added' }
        format.json { render json: @tee, status: :created, location: @tee }
      else
        format.html { render action: "new" }
        format.json { render json: @tee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tees/1
  # PUT /tees/1.json
  def update
    @tee = Tee.find(params[:id])

    respond_to do |format|
      if @tee.update_attributes(params[:tee])
        format.html { redirect_to @tee, notice: 'Tee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tees/1
  # DELETE /tees/1.json
  def destroy
    @tee = Tee.find(params[:id])
    @tee.destroy

    respond_to do |format|
      format.html { redirect_to tees_url }
      format.json { head :no_content }
    end
  end
end
