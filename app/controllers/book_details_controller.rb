require 'csv'
class BookDetailsController < ApplicationController
  before_action :set_book_detail, only: [:show, :edit, :update, :destroy]

  # GET /book_details
  # GET /book_details.json
  def index
    @book_details = BookDetail.all
  end

  # GET /book_details/1
  # GET /book_details/1.json
  def show
    @book_doc = BookDoc.new
    @entry = []
    @book_detail.bookids.pluck(:id).map{|yy| @entry << Entry.find_by(bookid_id: yy) }
    #Entry.where(bookid_id: @book_detail.bookids.pluck(:book_id))
  end
  def book_export
    @books = BookDetail.all
    send_data @books.to_csv, filename: "books.csv"

  
    
    # send_data root_url.to_s + "public/csv/my-books.csv"
    # respond_to do |format|
      # format.html
      
      # format.xls 
    # end
    # redirect_to book_details_path
    # redirect_to root_url.to_  s + "/public/csv/my-books.csv"
  end
  def block_book
   Entry.create(student_id: current_user.user_id,issue_date: Date.today,bookid_id: params[:book_id])
   Bookid.find(params[:book_id].to_i).update(is_issue: true)
  end
  # GET /book_details/new
  def new
    @book_detail = BookDetail.new
  end

  # GET /book_details/1/edit
  def edit
  end

  # POST /book_details
  # POST /book_details.json
  def create
    @book_detail = BookDetail.new(book_detail_params)
    if params[:publisher_name].present?
      @publisher = Publisher.create(publisher_name: params[:publisher_name])
      @book_detail.publisher_id = @publisher.id
    else
      @book_detail.publisher_id = params[:publisher_id].to_i
    end
    if params[:author_name].present?
      @author = Author.create(author_name: params[:author_name])
      @book_detail.author_id = @author.id
    else
      @book_detail.author_id =  params[:author_id]
    end
    if params[:domain_name].present? 
      @domain = Domain.create(domain_name: params[:domain_name])
      @book_detail.domain_id = @domain.id
    else
      @book_detail.domain_id = params[:domain_id]
    end
    respond_to do |format|
      if @book_detail.save
        params[:bookid].map do |id|
          if id.present?
            Bookid.create(book_id: id, book_detail_id: @book_detail.id, is_issue: false)
          end
        end
        format.html { redirect_to book_details_path, notice: 'Book detail was successfully created.' }
        format.json { render :show, status: :created, location: @book_detail }
      else
        format.html { render :new }
        format.json { render json: @book_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_details/1
  # PATCH/PUT /book_details/1.json
  def update
    respond_to do |format|
      if @book_detail.update(book_detail_params)
        format.html { redirect_to @book_detail, notice: 'Book detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_detail }
      else
        format.html { render :edit }
        format.json { render json: @book_detail.errors, status: :unprocessable_entity }
      end
    end
  end
  def upload
    # byebug
    @book_doc = BookDoc.new(book_detail_id: params[:book_detail_id], pdf_doc: params[:pdf_doc])

    # respond_to do |format|
      if @book_doc.save
        redirect_to book_detail_path(params[:book_detail_id])
      # else
       
      # end
    end
    
  end
  # DELETE /book_details/1
  # DELETE /book_details/1.json
  def destroy
    @book_detail.destroy
    respond_to do |format|
      format.html { redirect_to book_details_url, notice: 'Book detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_detail
      @book_detail = BookDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_detail_params
      params.require(:book_detail).permit(:book_name, :book_number, :book_edition, :author_type, :domain_id, :author_id, :publisher_id)
    end
end
