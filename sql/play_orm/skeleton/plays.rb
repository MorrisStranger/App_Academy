require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
  def self.find_by_playwright(name)
    data=PlayDBConnection.instance.execute(<<-SQL, name)
    select * from plays join playwrights on plays.playwright_id = playwrights.id where name = ?

    SQL
    data.map { |datum| Play.new(datum) }

  end
  def self.find_by_title(title)
    data=PlayDBConnection.instance.execute(<<-SQL, title)
    select * from plays where title = ?

    SQL
    data.map { |datum| Play.new(datum) }

  end
end

class Playwright
  attr_reader  :name, :birth_year
  attr_accessor :id
  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playwright.new(datum) }
  end
  def self.find_by_name(name)
    data = PlayDBConnection.instance.execute(<<-SQL, name)
      
    SELECT * FROM playwrights where name = ?
    
    SQL
    data.map { |datum| self.new(datum) }
  end
 
  def initialize(options)
    @id = options["id"]
    @name = options["name"]
    @birth_year = options["birth_year"]
  end
  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year)

    insert into playwrights (name,birth_year)
    values (?,?)

    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id

  end
  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL,self.name,self.birth_year,self.id)
    
    update playwrights
    set name = ?, birth_year = ?
    where id= ?
    SQL
  end
  def get_plays
  plays=PlayDBConnection.instance.execute(<<-SQL,self.id)
  select title from plays where playwright_id = ?

  SQL
  plays
  end
end

# p Play.find_by_playwright('Arthur Miller')
# p Play.find_by_title('All My Sons')
# p Playwright.find_by_name("Arthur Miller")
if __FILE__ == $PROGRAM_NAME
williams=Playwright.new({"name"=>"Tenessee Williams","birth_year"=>1911})

williams.create
p Playwright.all
get_plays_test=Play.new({"title"=>"all saints o","year"=>2020,"playwright_id"=>21})
get_plays_test.create
p williams.get_plays
end