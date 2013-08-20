class Cell
	NO_CHECK = false
	IS_CHECKED = true
	IS_LAND = 1
	IS_CELL = 0

	attr_reader :island, :checked

  def initialize
		@island,@checked = rand(2),NO_CHECK
  end

  def is_checked
		@checked = IS_CHECKED
  end

end

class Sea
	attr_reader :status, :cells, :row, :column

  def initialize(row, column)
		raise ArgumentError, ' m and n should be numberic and more than 2' unless (row.is_a? Numeric) && (column.is_a? Numeric) && (row > 2) && (column > 2)
		@status,@row,@column,@cells = true,row,column,[]
		set_islands_at_random
	end

  def set_islands_at_random
		draw unless (@cells = (0...@row).map{|i| (0...@column).map{|j| Cell.new}}).nil?
  end

  def draw
		(0...@row).each {|i| puts (0...@column).map{|j| "#{@cells[i][j].island}"}.join(' ') }
	end

  def count_island
		(0...@row).map{|i| (0...@column).map{|j| check_island(i,j)}}.flatten.select{|x| x==true }.size
  end

  def check_island(x,y)
		return false unless (@cells[x][y].island === Cell::IS_LAND) && (@cells[x][y].checked === Cell::NO_CHECK)
		@cells[x][y].is_checked
		check_island(x,y+1) if y+1 < @column
		check_island(x,y-1) if y-1 >= 0
		check_island(x+1,y) if x+1 < @row
		check_island(x-1,y) if x-1 >= 0
		true
  end

end

sea = Sea.new(5,5)
count = sea.count_island
if count > 0
  puts "\n There are #{count} island in this map"
else
  puts "\n There is not island in this map"
end
