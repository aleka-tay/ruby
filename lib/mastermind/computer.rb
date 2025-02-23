class Computer
  include Display
  attr_accessor :player_guess, :solution

  # Initializer: creates a random list of 4 int to be guessed
  def initialize
    @solution = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
    @number_of_moves = 0
  end

  # Game starting: keeps track of the game. Gives outcome of the game
  def game_start_computer
    p = player_move
    while p != @solution && !game_over
      game_steps(p)
      p = player_move
    end
    display_color(@solution)
    if game_over
      puts "Game is over Bro! Try next time! Solution was: #{@solution}"
    else
      puts 'You found the answer!'
    end
  end

  # Main steps of the game: player move, diplaying the choosing, displaying hints
  def game_steps(guess)
    display_color(guess)
    display_hints(computer_check(guess))
  end

  # Player move: askes for a random 4 ints from the user. Returns player guess
  def player_move
    player_guess = []
    4.times do
      puts 'Give an integer from 1-6'
      n = gets.to_i
      while n < 0 || n > 6 # If the input is out of range
        puts 'The value is out of range', 'Give an integer from 1-6'
        n = gets.to_i
      end
      player_guess.push(n)
    end
    @number_of_moves += 1 # Keeps track of the player moves
    player_guess
  end

  # Computer check: computer compares the results and returns hits to the game
  def computer_check(player_guess)
    hints = []
    @solution.each_with_index do |num, i|
      if num == player_guess[i] # If the number is right and the index is right
        hints.push('*')
      elsif player_guess.include?(num) # If only the number of right
        hints.push('?')
      end
    end
    hints
  end

  # Game over: Returns True if moves exceed 12
  def game_over
    return unless @number_of_moves > 12

    true
  end
end
