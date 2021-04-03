

require_relative './sqlzoo.rb'

def example_join
  execute(<<-SQL)
    SELECT
      *
    FROM
      movies
    JOIN
      castings ON movies.id = castings.movie_id
    JOIN
      actors ON castings.actor_id = actors.id
    WHERE
      actors.name = 'Sean Connery'
  SQL
end

def ford_films
  # List the films in which 'Harrison Ford' has appeared.
  execute(<<-SQL)
  select title from movies where id in
  (select movie_id from castings where actor_id = (select id from actors where name = 'Harrison Ford'))
  SQL
end

def ford_supporting_films
  # List the films where 'Harrison Ford' has appeared - but not in the star
  # role. [Note: the ord field of casting gives the position of the actor. If
  # ord=1 then this actor is in the starring role]
  execute(<<-SQL)


select title from movies where id in
(select movie_id from castings where actor_id = (select id from actors where name = 'Harrison Ford') and ord != 1)

  SQL
end

def films_and_stars_from_sixty_two
  # List the title and leading star of every 1962 film.
  
  execute(<<-SQL)
  


  select title,name from movies

  inner join 
  castings on movies.id = castings.movie_id

  inner join actors on castings.actor_id=actors.id
  where yr = 1962 and ord = 1

  SQL
end

def travoltas_busiest_years
  # Which were the busiest years for 'John Travolta'? Show the year and the
  # number of movies he made for any year in which he made at least 2 movies.

  execute(<<-SQL)
  select yr,count(title) from movies 
   inner join castings
   on movies.id = castings.movie_id

    inner join actors on
   actors.id = castings.actor_id
   where name = 'John Travolta'
    group by yr
    having count(title) >= 2
  SQL
end

# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#
#  movie_id    :integer      not null, primary key
#  actor_id    :integer      not null, primary key
#  ord         :integer

def andrews_films_and_leads
  # List the film title and the leading actor for all of the films 'Julie
  # Andrews' played in.


# select id,title,actor from movies where movie_id in (select movie_id from castings where actor_id = (select id from actors where name ='Julie Andrews'))
# inner join on movie_id

# gives movie titles
# select actor_id from castings where ord = 1  
execute(<<-SQL)
select name,title from 
(select id,title, actor from movies
 where movie_id in 
 (select movie_id from castings where actor_id = 
 (select id from actors where name = 'Julie Andrews'))) inner join castings



--   select * from movies 
  --(select title,movie_id from movies
  --inner join castings
  --on movies.id = castings.movie_id

  --inner join actors
  --on castings.actor_id=actors.id 
  --gets all actors that played in all films
  -- we want to filter the films down to those with julie andrews and select from them, the lead 
  where name = 'Julie Andrews') as food
  inner join actors
  -- gives all films julie andrews has played in
  -- to get the leading actor for those films 



  -- want to get cast list and title for julie andrews movies:
  select title from movies inner join castings inner join select from actors where name = 'Julie Andrews'

  
  SQL
end

def prolific_actors
  # Obtain a list in alphabetical order of actors who've had at least 15
  # starring roles.
  execute(<<-SQL)
  select name from movies 
  inner join castings 
  on movies.id = castings.movie_id
  inner join actors
  on castings.actor_id = actors.id
  where ord = 1
  group by name
  having count(title) >=15
  order by name
  -- select name from movie by actor name having count(titles) >= 15
  
  SQL
end

def films_by_cast_size
  # List the films released in the year 1978 ordered by the number of actors
  # in the cast (descending), then by title (ascending).

  execute(<<-SQL)
  (select title,count(actor_id) from movies
  inner join castings 
  on movies.id = castings.movie_id
  where yr = 1978
  group by id
    order by count(actor_id) desc,title)
  SQL
end

def colleagues_of_garfunkel
  # List all the people who have played alongside 'Art Garfunkel'.
  execute(<<-SQL)
  
  --select actor_id from castings where movie_id in 
  --(
  --select * from movies 
  --inner join castings
  --on movies.id = castings.movie_id
  --inner join actors  
  --on castings.actor_id = actors.id
  --where name = 'Art Garfunkel'
  --) inner join castings
  --inner join actors on 
  -- list cast list where
  -- for movies where art garfunkel is the lead
  --select name from movies
  --inner join 
  
  select name from actors 
  where id in
   (select actor_id from castings where movie_id in 

  (select movie_id from castings where actor_id = 
  (select id from actors where name = 'Art Garfunkel'))) 
  and name <> 'Art Garfunkel'

  SQL
end
