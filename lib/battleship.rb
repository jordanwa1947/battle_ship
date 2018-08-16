require './board_setup'
require './comp_ship'
require './player_ship'

computer_board = BoardSetup.new
player_board = BoardSetup.new
comp_ship = CompShip.new
array = comp_ship.comp_ship2
comp_cord1 = array[0]
comp_cord2 = array[1]

comp_ship3 = comp_ship.comp_ship3
while comp_ship3 == nil
  comp_ship3 = comp_ship.comp_ship3
end
comp_cord3 = comp_ship3[0]
comp_cord5 = comp_ship3[1]

if comp_cord3.ord == comp_cord5.ord
  comp_cord4 = comp_cord3.succ
else
  comp_cord4 = comp_cord3[0].succ + comp_cord3[1]
end
computer_board.update_board(comp_cord1)
computer_board.update_board(comp_cord2)
computer_board.update_board(comp_cord3)
computer_board.update_board(comp_cord4)
computer_board.update_board(comp_cord5)
computer_board.print_board

player_ship = PlayerShip.new
puts "Please enter your Coordinates for ship 2"
ship2 = player_ship.player_ship2
cord1 = ship2[0]
cord2 = ship2[1]

player_board.update_board(cord1)
player_board.update_board(cord2)
player_board.print_board

puts "Please enter your Coordinates for ship 3"
ship3 = player_ship.player_ship3
while ship3 == nil
  puts "Ships may not overlap"
  ship3 = player_ship.player_ship3
end
cord1 = ship3[0]
cord3 = ship3[1]

if cord1.ord == cord3.ord
  cord2 = cord1.succ
else
  cord2 = cord1[0].succ + cord1[1]
end

player_board.update_board(cord1)
player_board.update_board(cord2)
player_board.update_board(cord3)
player_board.print_board
