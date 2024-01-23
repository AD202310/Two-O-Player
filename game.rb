class Game
  def initialize(name)
    @name = name
    @player_1 = Player.new('Player 1')
    @player_2 = Player.new('Player 2')
  end

  def start
    puts "Start a new game!"
    turn
  end

  def show_score
    puts "P1: #{@player_1.lives}/3 vs P2: #{@player_2.lives}/3"
  end

  def winner(player)
    puts "#{player.name} wins with a score of #{player.lives}/3"
    puts '---------GAME-OVER--------'
    puts 'Good bye!'
    exit(0)
  end

  def score_check
    if @player_1.no_lives
      winner(@player_2)
    elsif @player_2.no_lives
      winner(@player_1)
    end
  end

  def turn
    @player_1.new_question
    score_check
    @player_2.new_question
    score_check
    show_score
    puts '---------NEW-TURN---------'
    turn
  end
end
