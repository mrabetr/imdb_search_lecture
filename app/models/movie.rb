class Movie < ApplicationRecord
  belongs_to :director

  # gem to enable elasticsearch -> do not use it now!
  # searchkick

  # include pg search code
  include PgSearch::Model

  # multi search -> do not use it now!
  # multisearchable against: [:title, :syllabus]

  # name a method
  pg_search_scope :search_by_title_syllabus,

  # specify which columns I am search
  against: [:title, :syllabus],

  # search in an associated table
  associated_against: {
    director: [:first_name, :last_name]
  },
  # full search text -> tsearch
  using: {
    tsearch: {
      prefix: true
    }
  }
end
