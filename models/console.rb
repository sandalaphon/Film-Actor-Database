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

binding.pry
nil