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










end