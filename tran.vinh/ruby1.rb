module Errors
  #class ExceptionType < StandardError; end
  Argument = Class.new(StandardError)
end

# This is an example, so you can change as you like
class Sea
  attr_accessor :x,:y
  def initialize(m, n)
    @x = m.to_i
    @y = n.to_i
    raise Errors::Argument unless  @x > 2 && @y > 2
    set_islands_at_random
  end

  def set_islands_at_random 
      @array = Array.new(@y) { Array.new(@x) {create_island}}
  end
  
  def create_island
    island = rand(3)
    island % 2
  end  
  
  def print_array 
    return nil if @array.nil?
    @array.each {|row| puts row.join(' ')}
  end  
  
  def count_island
    all_island = []
    @array.flatten.each_with_index{|island,index|  all_island.push(index) if island == 1 }
    check_island(all_island)
  end
  
  def check_island(all_island)
    island_group = []
    all_island.each {|index|
     island_group.push(group_island(index,[],all_island)) unless check_group_island(index,island_group)
    }
    island_group.length
  end
  
  
  def check_group_island(index, array)
    return false unless array && array.length > 0
    array.each {|sub|
      return true if sub.include?(index)
    }
    false
  end
  
  def group_island(index,group_island_array,all_island)
    group_island_array.push(index)
    get_island_around(index).each{|island| 
      group_island_array = find_sub_island!(island,group_island_array,all_island)
    }
    group_island_array
  end
  
  def get_island_around(index)
    top ,left, right, bot = index-@x, index -1, index +1, index+@x
    left =-1 if index % @x == 0
    right =-1 if index % @x == @x-1
    [top,left,right,bot]
  end  
  
  def find_sub_island!(index, group_island_array,all_island_array)
     if all_island_array.include?(index) && !group_island_array.include?(index)
       group_island_array = group_island(index,group_island_array,all_island_array)
     end
     group_island_array
  end  
  
end



@sea =Sea.new(4,3)
 (1..5).each do |i|
  puts "Test #{i}"
  @sea.set_islands_at_random
  @sea.print_array
  puts "Number of island : #{@sea.count_island.to_s}"
  puts ">>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<"
end