require_relative "Player"
# include Player

class Game
  attr_writer :fragment
  attr_accessor :dictionary
  def initialize(*players)
  # @already_guessed=[]

  @fragment = ""
  @players=players
  # @player2=player2
  @current_player=players[0]
  @previous_player=players[-1]
  @losses = Hash[players.collect { |item| [item, 0] } ]

  dict=Hash.new()
  i=1
  File.open('./dictionary.txt').each_line{ |s|
    i+=1
    dict[s.strip]=i
  } 
  @dictionary =dict
  end
  def fragment
    @fragment
  end
  # def play_round

  # end
  def players
  @players
  end
  def current_player
    @current_player
  end
  def previous_player
    @previous_player
  end
  def next_player!
    @previous_player=self.current_player
    @current_player=self.players[(self.players.index(current_player)+1) % self.players.length]
  
  # @current_player=@player2
  # @previous_player=@player1
  # else
    # @current_player=@player1
    # @previous_player=@player2
  end
  def take_turn(player)
    guess = player.guess 
    if valid_play?(guess)
      @fragment+=guess 
    # elsif @already_guessed.include?(guess)
    #     p "#{current_player}, you have already guessed that letter"
      
    # else
    #   @already_guessed << guess
    end
  
    if @dictionary.include?(@fragment)
      @dictionary.delete(@fragment)
      @losses[player]+=1
      self.fragment=""
    
  end
end
  def valid_play?(string)
    return @dictionary.keys.grep(/\A#{@fragment + string}/).any?
  end
  def losses
  @losses
  end
  def play_round
    take_turn(current_player)
    next_player!
    
  end 
  def run
    #while persons>1
    #change to if person =5 remove
  while losses.values.all? {|ele|ele<5}
  play_round
  display_standings
  
  end
  end
  
  def display_standings
    p @fragment
  (0...@losses.length).each{|i|
   p "#{@losses.keys[i].name} has #{record.key(@losses.values[i])}"
  }
  end
  def record
    {"no fails"=>0,"G"=>1,"GH"=>2,"GHO"=>3,"GHOS"=>4,"GHOST"=>5}
  end
end


sam=Player.new("sam")
jack=Player.new("jack")
lucy=Player.new("lucy")
newgame=Game.new(sam,jack,lucy)
# p newgame.losses
p newgame.dictionary.keys
newgame.run

#remove player when lose
#print player when he wins and end program
#add AI