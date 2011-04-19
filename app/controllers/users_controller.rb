class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  def export
    export_format         = params[:export_format]
    records_nb_to_export  = params[:records_nb_to_export]

    # first option which is handled by default by the plugin
    options = {:filename => "Users Export Example"}
    # adding an option which is personalized in lib/personalized_export_properties
    options.merge!({:records_nb_to_export => records_nb_to_export})
    u_e    = UserExporter.new
    if export_format == "google"
      # assuming the user's token is the first one in the table
      google_token_client = GoogleToken.first.client
      export              = u_e.to_google_spreadsheets({:access_token => google_token_client}.merge options)
      render :head => :ok
    elsif export_format == "excel"
      export = u_e.to_excel(options)
      download export.path
    end

  end
  
    # Serves a file to the client
  def download(server_file_path)
    send_file server_file_path
    rescue => e
      raise Exception, "File not found. Please ensure that your file was saved. Error was: #{e}"
  end
end
