class WordsPagesController < ApplicationController
  # GET /words_pages
  # GET /words_pages.json
  def index
    @words_pages = WordsPage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @words_pages }
    end
  end

  # GET /words_pages/1
  # GET /words_pages/1.json
  def show
    @words_page = WordsPage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @words_page }
    end
  end

  # GET /words_pages/new
  # GET /words_pages/new.json
  def new
    @words_page = WordsPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @words_page }
    end
  end

  # GET /words_pages/1/edit
  def edit
    @words_page = WordsPage.find(params[:id])
  end

  # POST /words_pages
  # POST /words_pages.json
  def create
    @words_page = WordsPage.new(params[:words_page])

    respond_to do |format|
      if @words_page.save
        format.html { redirect_to @words_page, notice: 'Words page was successfully created.' }
        format.json { render json: @words_page, status: :created, location: @words_page }
      else
        format.html { render action: "new" }
        format.json { render json: @words_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /words_pages/1
  # PUT /words_pages/1.json
  def update
    @words_page = WordsPage.find(params[:id])

    respond_to do |format|
      if @words_page.update_attributes(params[:words_page])
        format.html { redirect_to @words_page, notice: 'Words page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @words_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words_pages/1
  # DELETE /words_pages/1.json
  def destroy
    @words_page = WordsPage.find(params[:id])
    @words_page.destroy

    respond_to do |format|
      format.html { redirect_to words_pages_url }
      format.json { head :no_content }
    end
  end
end
