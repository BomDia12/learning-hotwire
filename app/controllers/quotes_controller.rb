class QuotesController < ApplicationController
  before_action :set_quote, only: [:edit, :update, :destroy]

  def index
    @quotes = Quote.all
  end

  def show
    begin
      set_quote
    rescue
      redirect_to quotes_path
    end
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      redirect_to quotes_path, notice: "Quote created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @quote.update(quote_params)
      redirect_to quotes_path, notice: "Quote edited successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy

    redirect_to do |format|
      format.turbo_stream
      format.html { redirect_to quotes_path, notice: "Quote deleted successfully." }
    end
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
