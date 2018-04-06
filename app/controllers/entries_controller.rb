class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.all#.where(tempissue: false)
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @entry = Entry.new
  end
  def entry_export
    @entries = Entry.all
   send_data @entries.to_csv, filename: "Entries.csv"
    # redirect_to entries_path
  end
  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  # POST /entries.json
  def create
    if params[:bookid_id1].nil?
    @entry = Entry.new()
    @entry.user_id = params[:user_id].to_i
    @entry.issue_date = params[:issue_date].to_date
    @entry.return_date = params[:issue_date].to_date + 1.month
    @entry.bookid_id = params[:bookid_id].nil? ? params[:bookid_id1].to_i: params[:bookid_id].to_i
    respond_to do |format|
      if @entry.save
        entry = Bookid.find(@entry.bookid_id)
        entry.update(is_issue: true)
        format.html { redirect_to entries_path, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  else
 @entry = Entry.all.where(tempissue: true, bookid_id: params[:bookid_id1])
 return_date = params[:issue_date].to_date + 1.month
 @entry.present? ? @entry[0].update(tempissue: false, return_date: return_date) : nil
  entry = Bookid.find(params[:bookid_id1])
        entry.update(is_issue: true)
 redirect_to entries_path 
 
  end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:student_id, :issue_date, :return_date, :book_detail_id)
    end
end
