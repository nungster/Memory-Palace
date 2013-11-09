class FamousPeopleController < ApplicationController

  before_filter :authenticate_user!, :except => ["index","show","code"]

  @Admin_menu = Hash.new

  @digit_codes = FamousPerson.find_all_by_code("ON")
  #@digit_codes = FamousPerson.select(:code).distinct
  #@digit_codes = FamousPerson.uniq.pluck(:code)
  #@digit_codes = FamousPerson.pluck("DISTINCT code")
   #@digit_codes = FamousPerson.select(:code).uniq

  def index
    puts("> ******** Famous People Controller")
     if current_user && (current_user.has_role? :admin)
      puts current_user.id
    end
    @Admin_menu = {"O - 1s" => "famous_people/code/OA",
                   "A - 10s" => "famous_people/code/AO",
                   "B - 20s" => "famous_people/code/BO",
                   "C - 30s" => "famous_people/code/CO",
                   "D - 40s" => "famous_people/code/DO",
                   "E - 50s" => "famous_people/code/EO",
                   "S - 60s" => "famous_people/code/SO",
                   "G - 70s" => "famous_people/code/GO",
                   "H - 80s" => "famous_people/code/HO",
                   "N - 90s" => "famous_people/code/NO"}

    #Rails.logger.info"#{@digit_codes.inspect}"
    #a = FamousPerson.find_all_by_code("ON")
    #Rails.logger.info "a=#{a.inspect}"


    #@famouspeople = FamousPerson.all
    #@posts = Post.paginate(:page => params[:page])
    #@famouspeople = FamousPerson.order(:code).paginate(:page => params[:page])
    @famouspeople = FamousPerson.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @famouspeople }
    end

  end

  # GET /events/1
  # GET /events/1.json
  def show
    @famouspeople = FamousPerson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @famouspeople }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @famouspeople = FamousPerson.new
    @famouspeople.user_id = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @famouspeople }
    end
  end

  # GET /events/1/edit
  def edit
    @famouspeople = FamousPerson.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @famouspeople = FamousPerson.new(params[:famous_person])

    respond_to do |format|
      if @famouspeople.save
        format.html { redirect_to @famouspeople, notice: 'FamousPeople was successfully created.' }
        format.json { render json: @famouspeople, status: :created, location: @famouspeople }
      else
        format.html { render action: "new" }
        format.json { render json: @famouspeople.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @famouspeople = FamousPerson.find(params[:id])

    respond_to do |format|
      if @famouspeople.update_attributes(params[:famous_person])
        format.html { redirect_to @famouspeople, notice: 'FamousPeople was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @famouspeople.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @famouspeople = FamousPerson.find(params[:id])
    @famouspeople.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  def code
    puts("> ******** Famous People Code")
    if current_user && (current_user.has_role? :admin)
      puts current_user.id
    end
    @Admin_menu = {"O - 1s" => "/famous_people/code/OA",
                   "A - 10s" => "/famous_people/code/AO",
                   "B - 20s" => "/famous_people/code/BO",
                   "C - 30s" => "/famous_people/code/CO",
                   "D - 40s" => "/famous_people/code/DO",
                   "E - 50s" => "/famous_people/code/EO",
                   "S - 60s" => "/famous_people/code/SO",
                   "G - 70s" => "/famous_people/code/GO",
                   "H - 80s" => "/famous_people/code/HO",
                   "N - 90s" => "/famous_people/code/NO"}

    @famouspeoplebycode = FamousPerson.paginate(:page => params[:page]).find_all_by_code(params[:code])

    @first_letter = params[:code][0]

    case @first_letter
      when "O"
        @tens = 0
      when "A"
        @tens = 10
      when "B"
        @tens = 20
      when "C"
        @tens = 30
      when "D"
        @tens = 40
      when "E"
        @tens = 50
      when "S"
        @tens = 60
      when "G"
        @tens = 70
      when "H"
        @tens = 80
      when "N"
        @tens = 90
      else
        @tens = 0
    end


    @letter_combo = [(@first_letter + "O"),
                      (@first_letter + "A"),
                      (@first_letter + "B"),
                      (@first_letter + "C"),
                      (@first_letter + "D"),
                      (@first_letter + "E"),
                      (@first_letter + "S"),
                      (@first_letter + "G"),
                      (@first_letter + "H"),
                      (@first_letter + "N")]


    Rails.logger.info "Selected Letter =#{@letter_combo[2].inspect}"


    respond_to do |format|
      format.html
      format.json { render json: @famouspeoplebycode }
    end

  end

  def addpeg
    puts("> ******** Famous People AddPeg")

    if current_user && (current_user.has_role? :admin)
      puts current_user.id
    end
    @Admin_menu = {"O - 1s" => "/famous_people/code/OA",
                   "A - 10s" => "/famous_people/code/AO",
                   "B - 20s" => "/famous_people/code/BO",
                   "C - 30s" => "/famous_people/code/CO",
                   "D - 40s" => "/famous_people/code/DO",
                   "E - 50s" => "/famous_people/code/EO",
                   "S - 60s" => "/famous_people/code/SO",
                   "G - 70s" => "/famous_people/code/GO",
                   "H - 80s" => "/famous_people/code/HO",
                   "N - 90s" => "/famous_people/code/NO"}

    @famouspeoplebycode = FamousPerson.paginate(:page => params[:page]).find_all_by_code(params[:code])

    @first_letter = params[:code][0]

    case @first_letter
      when "O"
        @tens = 0
      when "A"
        @tens = 10
      when "B"
        @tens = 20
      when "C"
        @tens = 30
      when "D"
        @tens = 40
      when "E"
        @tens = 50
      when "S"
        @tens = 60
      when "G"
        @tens = 70
      when "H"
        @tens = 80
      when "N"
        @tens = 90
      else
        @tens = 0
    end


    @letter_combo = [(@first_letter + "O"),
                     (@first_letter + "A"),
                     (@first_letter + "B"),
                     (@first_letter + "C"),
                     (@first_letter + "D"),
                     (@first_letter + "E"),
                     (@first_letter + "S"),
                     (@first_letter + "G"),
                     (@first_letter + "H"),
                     (@first_letter + "N")]

    respond_to do |format|
      format.html
      format.json { render json: @famouspeoplebycode }
    end

  end


end


