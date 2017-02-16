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

film2 = Film.new({
  'title' => "Logans Run",
  'year' => 1974,
  'genre' => "sci-fi"
  })

film2.save

actor1 = Actor.new({
'name' => "Peter Ustinov",
'gender' => "male",
'age' => 200
})
actor1.save

actor2 = Actor.new({
'name' => "Kirk Douglas",
'gender' => "male",
'age' => 97
 })
actor2.save

filmactor1 = FilmActor.new({
  'film_id' => film1.id,
  'actor_id' => actor1.id
  })
filmactor1.save

filmactor2 = FilmActor.new({
'film_id' => film1.id,
'actor_id' => actor2.id
})
filmactor2.save

filmactor3 = FilmActor.new({
  'film_id' => film2.id,
  'actor_id' => actor1.id
  })

filmactor3.save



binding.pry
nil