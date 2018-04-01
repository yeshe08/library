class BookDocsController < ApplicationController
  before_action :set_book_doc, only: [:show, :edit, :update, :destroy]

  # GET /book_docs
  # GET /book_docs.json
  def index
    @book_docs = BookDoc.all
  end

  # GET /book_docs/1
  # GET /book_docs/1.json
  def show
  end

  # GET /book_docs/new
  def new
    @book_doc = BookDoc.new
  end

  # GET /book_docs/1/edit
  def edit
  end

  # POST /book_docs
  # POST /book_docs.json
  def create
    @book_doc = BookDoc.new(book_doc_params)

    # respond_to do |format|
      if @book_doc.save
        redirect_to book_detail_path(params[:book_doc][:book_detail_id])
        # format.html { redirect_to @book_doc, notice: 'Book doc was successfully created.' }
        # format.json { render :show, status: :created, location: @book_doc }
      # else
        # format.html { render :new }
        # format.json { render json: @book_doc.errors, status: :unprocessable_entity }
      # end
    end
  end

  # PATCH/PUT /book_docs/1
  # PATCH/PUT /book_docs/1.json
  def update
    respond_to do |format|
      if @book_doc.update(book_doc_params)
        format.html { redirect_to @book_doc, notice: 'Book doc was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_doc }
      else
        format.html { render :edit }
        format.json { render json: @book_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_docs/1
  # DELETE /book_docs/1.json
  def destroy
    @book_doc.destroy
    respond_to do |format|
      format.html { redirect_to book_docs_url, notice: 'Book doc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def view_pdf
    # byebug
    # id = params[:id]
    pdf_filename = File.join(root_url, params[:id])
    # byebug
    send_file(pdf_filename, :filename => "test.pdf", :type => "application/pdf")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_doc
      @book_doc = BookDoc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_doc_params
      params.require(:book_doc).permit(:book_name, :pdf_doc, :book_detail_id)
    end
end
