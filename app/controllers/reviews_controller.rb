class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :set_movie

  # GET /reviews or /reviews.json


  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id  
    #user id assign to dem when user create reviews 
    @review.movie_id = @movie.id

    # redirect_to @movie, notice: "Review was successfully created."

    respond_to do |format|
      if @review.save
        format.html { redirect_to @movie, notice: "Review was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update

 redirect_to @movie, notice: "Review was successfully updated."

    # respond_to do |format|
    #   if @review.update(review_params)
    #     format.html { redirect_to @movie, notice: "Review was successfully updated." }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @review.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Review was successfully destroyed." }
      # format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." } 
      #here redirect_to used to rediect path and here path is like {reviews_url} and {root_path isroot "movies#index"}   
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end


    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
