class Game
  include Display
  def play
    puts 'Choose a mode you want to play: player vs player (1) or player vs computer (2) or quit (3):'
    s = gets.chomp.to_i
    while s.to_i != 1 && s.to_i != 2 && s.to_i != 3
      puts 'Choose a mode you want to play: player vs player (1) or player vs computer (2):'
      s = gets.chomp
    end

    if s.to_i == 1
      p = Player.new
      p.game_start_player
    elsif s.to_i == 2
      c = Computer.new
      c.game_start_computer
    elsif s.to_i == 3
      puts 'Bye-bye'
    end
  end
end
