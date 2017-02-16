class Film

  attr_accessor :title, :year, :genre
  attr_reader :id

  def initialize ( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @year = options['year']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO films (title, year, genre) VALUES ('#{@title}', #{@year}, '#{@genre}') RETURNING *;"
    result = SqlRunner.run(sql)
    film_hash = result[0]
    @id = film_hash['id'].to_i

  end

end