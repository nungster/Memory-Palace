class PalacesController < ApplicationController

  before_filter :authenticate_user!, :set_digits

  def set_digits
    @digits = ['OO','OA','OB','OC','OD','OE','OS','OG','OH','ON',
               'AO','AA','AB','AC','AD','AE','AS','AG','AH','AN',
               'BO','BA','BB','BC','BD','BE','BS','BG','BH','BN',
               'CO','CA','CB','CC','CD','CE','CS','CG','CH','CN',
               'DO','DA','DB','DC','DD','DE','DS','DG','DH','DN',
               'EO','EA','EB','EC','ED','EE','ES','EG','EH','EN',
               'SO','SA','SB','SC','SD','SE','SS','SG','SH','SN',
               'GO','GA','GB','GC','GD','GE','GS','GG','GH','GN',
               'HO','HA','HB','HC','HD','HE','HS','HG','HH','HN',
               'NO','NA','NB','NC','ND','NE','NS','NG','NH','NN',]
  end
  #GET /palaces
  # GET /palaces.json
  def index
    puts("> ********")
    puts current_user.id

    @palaces = Palace.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @palaces }
    end
  end

  # GET /palaces/1
  # GET /palaces/1.json
  def show
    @palace = Palace.find(params[:id])
    session[:current_palace] = @palace.id

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @palace }
    end
  end

  # GET /palaces/new
  # GET /palaces/new.json
  def new
    @palace = Palace.new(:ptype => 1)
    @palace.user_id = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @palace }
    end
  end

  # GET /palaces/1/edit
  def edit
    @palace = Palace.find(params[:id])
  end

  # POST /palaces
  # POST /palaces.json
  def create
    @palace = Palace.new(params[:palace])
    @palace.user_id = current_user.id

    respond_to do |format|
      if @palace.save
        format.html { redirect_to @palace, notice: 'palace was successfully created.' }
        format.json { render json: @palace, status: :created, location: @palace }
      else
        format.html { render action: "new" }
        format.json { render json: @palace.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /palaces/1
  # PUT /palaces/1.json
  def update
    @palace = Palace.find(params[:id])

    respond_to do |format|
      if @palace.update_attributes(params[:palace])
        format.html { redirect_to @palace, notice: 'Palace was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @palace.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /palaces/1
  # DELETE /palaces/1.json
  def destroy
    @palace = Palace.find(params[:id])
    @palace.destroy

    respond_to do |format|
      format.html { redirect_to palaces_url }
      format.json { head :no_content }
    end
  end



end
