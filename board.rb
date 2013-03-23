require 'debugger'
require 'colorize'

class Board
  attr_accessor :board
  
  def initialize
    @board = board
    make_board
  end
   
  def make_board
    make_blank_board
    populate_board
  end

  def make_blank_board
     board = []
     8.times do
       row = []
       8.times {row << "_"}
       board << row
     end
     @board = board
  end
  
  def display_board
    print "     ".colorize(:background => :blue).colorize(:white)
    ("a".."h").each {|letter| print " #{letter}   ".colorize(:white).colorize(:background=>:blue)}
    puts
    @board.each_with_index do |row, index1|
      print " #{(8-index1)}  ".colorize(:white).colorize(:background => :blue)
      row.each_with_index do |square, index2|
        unless square == nil
          if square.class == Piece && square.color == :black
            row[index2] = "\u263B"
          elsif square.class == Piece && square.color == :red
            row[index2] = "\u263A"
          elsif square == "_"
            row[index2] = " "
          end
        end
      end
      p row
      puts
    end
  end

  def populate_board
     @board.each_with_index do |row, index1|
       #color = :black if index = 5-7
       #color = :red if index = 0-3
       # YES, this needs to be refactored.  Ugly as sin.
       if index1 == 1 or index1 == 6 
         row.each_with_index do |square, index2|
           position = [index1, index2]
           if index2 % 2 == 1 && index1 == 1)
             @board[index1][index2] = Piece.new(:red, position)
           elsif index2 % 2 == 0 && index1 == 6
             @board[index1][index2] = Piece.new(:black, position)
           end
         end
       end
       
       if index1 == 0 or index1 == 7 or index1 == 2 or index1 == 5
         row.each_with_index do |square, index2|
           position = [index2, index1]
           if index2 % 2 == 0 && index1 == 0 
             @board[index1][index2] = Piece.new(:red, position)
            elsif index2 % 2 == 0 && index1 == 2
              @board[index1][index2] = Piece.new(:red, position)
           elsif index2 % 2 == 1 && index1 == 7
             @board[index1][index2] = Piece.new(:black, position)
             elsif index2 % 2 == 1 && index1 == 5
                @board[index1][index2] = Piece.new(:black, position)
           end
         end
       end
      end 
   end
 end
