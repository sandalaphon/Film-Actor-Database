require ('pg')
require ('pry')
require_relative('film.rb')
require_relative('actor.rb')
require_relative('film_actors_join.rb')
require_relative('../db/sql_runner.rb')

film1 = Film.new({
'title' => "Spartacus",
'year' => 1979,
'genre' => "epic"
})
film1.save

actor1 = Actor.new({
'name' => "Peter Ustinov",
'gender' => "male",
'age' => 200
})
actor1.save

filmactor1 = FilmActor.new({
  'film_id' => film1.id,
  'actor_id' => actor1.id
  })

filmactor1.save



binding.pry
nil