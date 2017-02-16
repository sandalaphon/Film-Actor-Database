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

  def actors()
     sql = "SELECT actors.* FROM actors INNER JOIN films_actors ON films_actors.actor_id = actors.id WHERE film_id = #{@id}"
     return Actor.get_many(sql)
     # actors = SqlRunner.run(sql)
     # return actors.map {|actor| Actor.new(actor)}
  end

  def self.get_many(sql)
    films = SqlRunner.run(sql)
    return films.map {|film| Film.new(film)}

  end

end