class MoviesController < ApplicationController
  def index
    @movies = ['Iron Max', 'Superdog', 'Flashy Flash', 'Wonder Wooman']
  end
end
