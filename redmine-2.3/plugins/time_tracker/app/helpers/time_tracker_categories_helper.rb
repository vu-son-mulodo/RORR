module TimeTrackerCategoriesHelper
  class Tree
    attr_reader :list_root, :list, :html, :controller

    def initialize(array)
      @list_root,@list,@html,@controller = [], {}, '', 'time_tracker_categories'
      array.each {|e|
        if e.parent_id == 0
          @list_root.push(e.id)
        else
          @list[e.parent_id] = {:info => nil, :list => [] } if @list[e.parent_id].nil?
          @list[e.parent_id][:list].push(e.id)
        end
        if @list[e.id].nil?
          @list[e.id] = {:info => e, :list => []}
        else
          @list[e.id][:info] = e if @list[e.id][:info].nil?
          @list[e.id][:list] = [] if @list[e.id][:list].nil?
        end
      }
      show
    end

    private

    def show
      @list_root.each {|e| show_item(@list[e]) }
    end

    def show_item(item)
      @html << "<li>"
      unless item[:list].size == 0
        @html << "<span>#{item[:info].name}</span> &nbsp; #{link_new_child(item[:info].id)} #{link_edit(item[:info].id)}"
        @html << "<ul>"
        item[:list].each {|it| show_item(@list[it]) }
        @html << "</ul>"
      else
        @html << "#{item[:info].name} &nbsp; #{link_new_child(item[:info].id)} #{link_edit(item[:info].id)} #{link_del(item[:info].id) }"
      end
      @html << "</li>"
    end

    def link_del(id)
      "<a rel=\"nofollow\" data-method=\"delete\" data-confirm=\"Are you sure?\" href=\"/#{@controller}/#{id}\" alt=\"del\"><img src=\"/images/delete.png\" height=\"16\" width=\"16\" alt=\"del\" border=\"0\"></a>"
    end

    def link_edit(id)
      "<a href=\"/#{@controller}/#{id}/edit\" alt=\"edit\"><img src=\"images/edit.png\" height=\"16\" width=\"16\" alt=\"edit\" border=\"0\"></a>"
    end

    def link_new_child(id)
      "<a href=\"/#{@controller}/#{id}/new\" alt=\"add child\"><img src=\"images/add.png\" height=\"16\" width=\"16\" alt=\"add\" border=\"0\"></a>"
    end

    def link_view_time_tracker(id)
      "<a href=\"/#{@controller}/#{id}\" alt=\"view time tracker list\"><img src=\"images/text_list_bullets.png\" height=\"16\" width=\"16\" alt=\"add\" border=\"0\"></a>"
    end

  end

end
