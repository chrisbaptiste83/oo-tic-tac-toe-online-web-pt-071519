
    
class TicTacToe 
  def initialize
    @board = Array.new(9," ") 
  end
    WIN_COMBINATIONS = [ 
      [0,1,2], 
      [3,4,5],
      [6,7,8],
      [0,4,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [2,4,6] 
      ] 
  def display_board 
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} " 
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " 
  end 
 def  input_to_index(user_input) 
   user_input.to_i - 1
  end 
  def move(index, token="X") 
    @board[index]= token
    
  end
  
  def position_taken?(index)
   if  @board[index] == "X" || @board[index]== "O" 
     true 
   else 
     false 
   end 
 end  
 
 def valid_move?(index)
 index.between?(0,8) && !position_taken?(index)
 end  
 
 def turn_count 
@board.count {|space| space == "X" || space == "O"}
end 
def current_player
  if turn_count % 2 ==0 
    "X" 
  else 
    "O" 
  end 
end 

  def turn
      puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    player = current_player
    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
    end
end
 
 def full? 
  @board.all? {|index| index == "X" || index == "O"}
 end 
 
  def won? 
    WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return win_combo
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return win_combo
    end
      false
  end
end

def draw? 
  !won? && full? 
end 

def over? 
  draw? || won? || full? 
end 

def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end 
  
  def play
    while over? == false
    	turn
    end

    if draw?
    	puts "Cat's Game!"
    elsif winner == "X" 
    	puts "Congratulations X!"
    elsif winner == "O"
    	puts "Congratulations O!"
    end
end 
end
