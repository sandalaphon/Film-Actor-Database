class Actor
attr_accessor :name, :gender, :age
attr_reader :id
def initialize ( options )
@id = options['id'].to_i
@name = options['name']
@gender = options['gender']
@age = options['age']
end

def save()
sql = "INSERT INTO actors (name, gender, age)
VALUES ('#{@name}', '#{@gender}', #{@age}) RETURNING *;"
actors=SqlRunner.run(sql)
@id = actors[0]['id'].to_i
end

def films()
  sql = "SELECT films.* FROM films INNER JOIN
        films_actors ON films_actors.film_id = films.id WHERE actor_id = #{id};"
  return Film.get_many(sql)
end

def self.get_many(sql)
  actors = SqlRunner.run(sql)
  return actors.map {|actor| Actor.new(actor)}

end


def self.delete_all
  sql = "DELETE FROM actors;"
  SqlRunner.run(sql)
end







end