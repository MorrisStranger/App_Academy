# PHASE 2
class CoffeeError < StandardError
end
class NormalError < StandardError
end


# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  begin
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
else 
  puts "you didnt enter a fruit!"
  raise NormalError
end
# rescue StandardError => e
#       puts "error was anooying #{e.message}"
    end
end

def feed_me_a_fruit
    puts "Hello, I am a friendly monster. :)"
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    begin

    maybe_fruit = gets.chomp
    if maybe_fruit.downcase =="coffee"
      raise CoffeeError
    end
  rescue CoffeeError => e
    puts "you entered coffee please retry "
    puts "this was the message #{e.message}"
    retry
    reaction(maybe_fruit)

  end

end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    begin
    if @yrs_known <5
      raise StandardError

    end
    rescue StandardError=> e

    @yrs_known = 10

    puts "#{e.message}"
    end
    begin
    if @name.length <=0 || @fav_pastime.length <=0
      raise StandardError
    end
  rescue
    puts "name is too short"
  end
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


