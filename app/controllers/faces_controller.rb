class FacesController < ApplicationController
  respond_to :json
  # GET /faces
  # GET /faces.json
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def find
    if params[:email]
      @face = Face.create_or_find(params[:email])
      if @face.url.empty?
        render :status => 500
      else
        redirect_to "/faces/#{@face.id}.json"
      end
    else 
      render :status => 500
    end
  end


  # GET /faces/1
  # GET /faces/1.json
  def show
    @face = Face.find(params[:id])

    respond_to do |format|
      format.html { render json: @face }
      format.json { render json: @face }
    end
  end

  # GET /faces/new
  # GET /faces/new.json
  def new
    @face = Face.new

    respond_to do |format|
      format.html { render json: @face }
      format.json { render json: @face }
    end
  end


  # POST /faces
  # POST /faces.json
  def create
    @face = Face.new(params[:face])

    respond_to do |format|
      if @face.save
        format.html { redirect_to @face, notice: 'Face was successfully created.' }
        format.json { render json: @face, status: :created, location: @face }
      else
        format.html { render action: "new" }
        format.json { render json: @face.errors, status: :unprocessable_entity }
      end
    end
  end

end
