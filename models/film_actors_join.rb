class FilmActor

  attr_accessor :film_id, :actor_id
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id']
    @actor_id = options['actor_id']

  end

  def save()
    sql = "INSERT INTO films_actors (film_id, actor_id) VALUES (#{@film_id}, #{@actor_id}) RETURNING *;"
    ids = SqlRunner.run(sql)
    @id = ids[0]['id'].to_i

  end

  def self.delete_all
    sql = "DELETE FROM films_actors;"
    SqlRunner.run(sql)
  end

end