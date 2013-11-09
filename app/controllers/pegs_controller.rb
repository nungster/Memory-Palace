class PegsController < ApplicationController

  before_filter :authenticate_user!

  #GET /pegs
  # GET /pegs.json
  def index
    puts("> ********")
    puts current_user.id

    @pegs = Peg.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pegs }
    end
  end

  # GET /pegs/1
  # GET /pegs/1.json
  def show
    @peg = Peg.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @peg }
    end
  end

  # GET /pegs/new
  # GET /pegs/new.json
  def new
    @peg = Peg.new
    @peg.user_id = current_user.id
    @peg.palace_id = params[:palace_id]

    puts("> Peg New ********")
    puts params[:palace_id]
    puts @peg.palace_id
    puts("> ********")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @peg }
    end
  end

  # GET /pegs/1/edit
  def edit
    @peg = Peg.find(params[:id])
  end

  # POST /pegs
  # POST /pegs.json
  def create
    @peg = Peg.new(params[:peg])
    @peg.user_id = current_user.id

    puts("create > ********")
    puts params[:peg]
    puts params[:palace_id]
    puts @peg.palace_id
    puts("> ********")

    respond_to do |format|
      if @peg.save
        format.html { redirect_to @peg, notice: 'peg was successfully created.' }
        format.json { render json: @peg, status: :created, location: @peg }
      else
        format.html { render action: "new" }
        format.json { render json: @peg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pegs/1
  # PUT /pegs/1.json
  def update
    @peg = Peg.find(params[:id])

    respond_to do |format|
      if @peg.update_attributes(params[:peg])
        format.html { redirect_to @peg, notice: 'peg was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @peg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pegs/1
  # DELETE /pegs/1.json
  def destroy
    @peg = Peg.find(params[:id])
    @peg.destroy

    respond_to do |format|
      format.html { redirect_to pegs_url }
      format.json { head :no_content }
    end
  end


  def add
    @peg = Peg.new(params[:peg])
    @person = FamousPerson.find(params[:fp_id])
    @palace = Palace.find(session[:current_palace])

    @peg.user_id = current_user.id
    @peg.palace_id = session[:current_palace]

    @peg.fp_id = params[:fp_id]
    @peg.code = @person.code
    @peg.title = @person.title
    @peg.first_name = @person.first_name
    @peg.middle_name = @person.middle_name
    @peg.last_name = @person.last_name
    @peg.link = @person.link
    @peg.note = @person.note


    puts("add peg > ********")
    puts session[:current_palace]
    puts @peg.palace_id
    puts("********")
    puts params[:fp_id]
    puts @peg.fp_id
    puts("********")

    respond_to do |format|
      if @peg.save
        format.html { redirect_to @palace, notice: 'peg was successfully created.' }
        format.json { render json: @peg, status: :created, location: @peg }
      else
        format.html { render action: "new" }
        format.json { render json: @peg.errors, status: :unprocessable_entity }
      end
    end
  end

end
