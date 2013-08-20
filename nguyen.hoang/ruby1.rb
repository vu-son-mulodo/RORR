class Sea
  attr_accessor :colums, :rows , :matrix_sea

  def initialize(m, n)
    @colums, @rows = m, n
    @matrix_sea = Array.new(n) { Array.new(m) }
    (0..n-1).map{|i| (0..m-1).map{|j| @matrix_sea[i][j]= rand(2)} }
    print_matrix_sea(@matrix_sea)
  end

  def set_islands_at_random(matrix_sea, row, col, visited_cell)
    row_neighbor = [ 1, -1, 0, 0]
    col_neighbor = [ 0, 0, 1, -1]
    visited_cell[row][col] = true
    (0..3).each {|k| set_islands_at_random(matrix_sea, row + row_neighbor[k], col + col_neighbor[k], visited_cell) if is_safe(matrix_sea, row + row_neighbor[k], col + col_neighbor[k], visited_cell)}
  end

  def is_safe(matrix_sea,row,col,visited_cell)
    return (row >= 0) && (row < @rows) &&                      # row number is in range
           (col >= 0) && (col < @colums) &&                    # column number is in range
           (matrix_sea[row][col] > 0 && visited_cell[row][col] == false) # value is 1 and not yet visited_cell
  end

  def count_island
    @counts = 0
    visited_cell = Array.new(rows) { Array.new(colums,false) }
    (0..@rows-1).map{|i| (0..@colums-1).map{|j| is_island?(i,j,matrix_sea,visited_cell) }}
    puts "Number islands is : #{@counts}"
  end

  def is_island?(i,j,matrix_sea,visited_cell)
    if isCell?(matrix_sea,i,j) && visited_cell[i][j] == false
      set_islands_at_random(matrix_sea, i, j, visited_cell)
      @counts += 1
    end
  end

  def isCell?(matrix_sea,i,j)
    return true if matrix_sea[i][j] == 1
    return false if matrix_sea[i][j] == 0
  end

  def print_matrix_sea(arrs)
    arrs.each do |inner|
      inner.each do |n| print "#{n} " end
      puts
    end
  end

end

sea = Sea.new(4,3)
sea.count_island

sea = Sea.new(7,5)
sea.count_island
