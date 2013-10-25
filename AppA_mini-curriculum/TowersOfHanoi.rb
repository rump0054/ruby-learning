require 'debugger'

class TowersOfHanoi
  VALID_ARGS = ["left", "l", "middle", "m", "right", "r"]

  def initialize(num_of_discs = 5)
    @num_of_discs = num_of_discs
    @left_peg =* (1..@num_of_discs)
    @middle_peg = []
    @right_peg = []
    @totalMoves = 0
  end

  def play
    puts "Welcome to Towers of Hanoi!\n---------------------------\n"
    puts "When prompted, choose a peg by entering one of left, middle, or right.\n"
    puts "You may also use the shortcuts l, m, or r.\n"
    print_game_board

    loop do
      command = get_command

      puts "\n"
      move_disc(command)
      print_game_board

      if game_won
        puts "You're a winner!"
        break
      end
    end
  end

  def get_command
    from_to_pegs = []

    puts "Enter the peg to remove a disc from: "
    from_to_pegs << get_user_command

    puts "Enter the peg to add the disc too: "
    from_to_pegs << get_user_command

    from_to_pegs
  end

  def get_user_command
    user_command = gets.chomp.downcase

    if !VALID_ARGS.include?(user_command)
      puts "Invalid input.  Please select one of #{VALID_ARGS.join(", ")}."
      user_command = get_user_command
    end

    user_command
  end

  def move_disc(peg_chars)
    message = ""

    from_peg = choose_peg_by_char(peg_chars[0])
    to_peg = choose_peg_by_char(peg_chars[1])

    if from_peg.count < 1
      message = "There are no discs to move off of this peg."
    elsif from_peg == to_peg
      message = "Opps... you tried to remove and place the '#{from_peg[0]}'' disc on the same peg."
    elsif (to_peg.count != 0) && (from_peg[0] > to_peg[0])
      message = "Opps... you can't place the '#{from_peg[0]}' disc on the '#{to_peg[0]}' disc because it's bigger."
    elsif (to_peg.count == 0) || (from_peg[0] < to_peg[0])
      to_peg.unshift(from_peg.shift)
      message = "The '#{to_peg[0]}' disc was moved from the #{peg_chars[0]} peg to the #{peg_chars[1]} peg."
    end

    @totalMoves += 1
    puts message
  end

  def game_won


    winner = false

    if (@right_peg.count == @num_of_discs) && (@right_peg.join == (1..@num_of_discs).to_a.join)
      winner = true
    end

    winner
  end

  def print_game_board
    puts "\n---Current Board---\n"
    puts "  Left Peg: #{@left_peg.join(", ")}\nMiddle Peg: #{@middle_peg.join(", ")}\n Right Peg: #{@right_peg.join(", ")}"
    puts "-------------------\n"
  end

  def choose_peg_by_char(char)
    case char.downcase
      when "left"
        @left_peg
      when "l"
        @left_peg
      when "middle"
        @middle_peg
      when "m"
        @middle_peg
      when "right"
        @right_peg
      when "r"
        @right_peg
    end
  end
end

toh = TowersOfHanoi.new(3)
toh.play