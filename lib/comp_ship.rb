class CompShip
  attr_accessor :comp_cords1, :comp_cords2, :comp_cords3
  def initialize
  @comp_cords1 = ["A1", "A2", "A3", "A4",
                  "B1", "B2", "B3", "B4",
                  "C1", "C2", "C3", "C4",
                  "D1", "D2", "D3", "D4"]

  @comp_cords2 = [["A2","B1"], ["A1","B2","A3"], ["A2","B3","A4"], ["A3","B4"],
    ["A1","B2","C1"], ["B1","A2","B3","C2"], ["B2","A3","B4","C3"], ["B3","A4","C4"],
    ["B1","C2","D1"], ["C1","B2","C3","D2"], ["C2","B3","C4","D3"], ["C3","B4","D4"],
    ["C1","D2"], ["D1","C2","D3"], ["D2","C3","D4"], ["D3","C4"]]

  @comp_cords3 = [["C1","A3"], ["C2","A4"], ["A1","C3"], ["A2","C4"],
                  ["D1","B3"], ["D2","B4"], ["B1","D3"], ["B2","D4"],
                  ["A1","C3"], ["A2","C4"], ["A3","C1"], ["C2","A4"],
                  ["B1","D3"], ["B2","D4"], ["B3","D1"], ["B4","D2"]]
  end

  def comp_ship2
    ship2_cord1 = comp_cords1.sample
    index1 = comp_cords1.index(ship2_cord1)
    ship2_cord2 = comp_cords2[index1].sample
    comp_cords1[index1] = nil
    comp_cords1[comp_cords1.index(ship2_cord2)] = nil
    x = 15
    16.times do
      array = comp_cords3[x]
      array.delete_if { |y| y == ship2_cord1}
      array.delete_if { |y| y == ship2_cord2}
      x -= 1
    end
    Array[ship2_cord1, ship2_cord2]
  end

  def comp_ship3
    ship3_cord1 = comp_cords1.sample
    while ship3_cord1 == nil
      ship3_cord1 = comp_cords1.sample
    end
    ship3_cord2 = comp_cords3[comp_cords1.index(ship3_cord1)].sample
    array = [ ship3_cord1, ship3_cord2 ].sort
    ship3_cord1 = array[0]
    ship3_cord2 = array[1]
    index3 = comp_cords1.index(ship3_cord1)

    if ship3_cord2.ord == ship3_cord1.ord
      array = nil if comp_cords1[index3 + 1].nil?
    else ship3_cord2.ord != ship3_cord1.ord
      array = nil if comp_cords1[index3 + 4].nil?
    end
    array
  end
end
