class MoviesController < ApplicationController
  def index
    if params[:query]
      # # search for exact match
      # @movies = Movie.where(title: params[:query])

      # # search for any title containing the query
      # @movies = Movie.where("title LIKE ?", "%#{params[:query]}%")

      # # search for any title containing the query -> case insensitive
      # @movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")

      # #search in multiple columns
      # #@movies = Movie.where("title ILIKE ? OR syllabus ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")

      # @movies = Movie.where("title ILIKE :query OR syllabus ILIKE :query", query: "%#{params[:query]}%")

      # # search for directors name -> Nolan

      # sql_query = "
      #   movies.title ILIKE :query
      #   OR movies.syllabus ILIKE :query
      #   OR directors.first_name ILIKE :query
      #   OR directors.last_name ILIKE :query
      #   "
      #  @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")

      # # multiple search term - POSTGRESQL

      # sql_query = "
      #   movies.title @@ :query
      #   OR movies.syllabus @@ :query
      #   OR directors.first_name @@ :query
      #   OR directors.last_name @@ :query
      #   "
      #  @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")

      @movies = Movie.search_by_title_syllabus(params[:query])

    else
      @movies = Movie.all
    end

  end
end


# SELECT * FROM movies
# WHERE title = 'Superman'

# SELECT * FROM movies
# WHERE title LIKE '%Superman%'

# SELECT * FROM movies
# WHERE title ILIKE '%Superman%'

# SELECT * FROM movies
# WHERE title ILIKE '%gotham%'
# OR syllabus ILIKE '%gotham%'

# SELECT * FROM movies
# JOIN diretors ON directors.id = movies.director_id
# WHERE movies.title ILIKE '%nolan%'
# OR movies.syllabus ILIKE '%nolan%'
# OR director.first_name ILIKE '%nolan%'
# OR director.last_name ILIKE '%nolan%'
