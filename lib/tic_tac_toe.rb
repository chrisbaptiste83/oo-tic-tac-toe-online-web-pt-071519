
    
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
 if position_taken?(index) || index > 9
     false
   else 
     true 
   end 
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
   if !valid_move?(index)
      turn
    else 
      move(index, current_player)
    end
  display_board
end

    end
end
 
 def full? 
  @board.all? {|index| index == "X" || index == "O"}
 end 
 

   
 
  
end 

