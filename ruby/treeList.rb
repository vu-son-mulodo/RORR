  class Tree
    attr_reader :list_root, :list, :html

    def initialize(array)
      @list_root,@list,@html = [], {},''
      array.each {|e|
        e[2].nil? ? @list_root.push(e[0]) : @list[e[2]][:list].push(e[0])
        @list[e[0]] = {:info => e, :list => [] }
      }
    end

    def show
      @list_root.each {|e| show_item(@list[e]) }
    end

    def show_item(item)
      @html << "<li>"
      unless item[:list].size == 0
        @html << "<span>#{item[:info][1]}</span>"
        @html << "<ul>"
        item[:list].each {|it|
          show_item(@list[it])
        }
        @html << "</ul>"
      else
        @html << "#{item[:info][1]}"
      end
      @html << "</li>"
    end

  end
array = [
  [1,'a',nil],
  [2,'b',nil],
  [3,'aa',1],
  [4,'c',nil],
  [5,'aaa',1],
  [6,'cc',4],
  [7,'aaaa',1],
  [8,'bb',2],
  [9,'ccc',4],
  [10,'d',nil],
  [11,'aab', 3],
  [12,'aabc',11],
  [13,'bbc',8]
]

temp = Tree.new(array)
temp.show