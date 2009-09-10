module NAPCS
  module TooltipHelpers
  
    def tooltip_script_tag
       javascript_include_tag "tooltip.js"
    end
    
    def add_tooltips_to_titles
      %Q{<script type='text/javascript'>
        // create popups for each element with a title attribute
      Event.observe(window,"load",function() {
        $$("*").findAll(function(node){
          return node.getAttribute('title');
        }).each(function(node){
          new Tooltip(node,node.title);
          node.removeAttribute("title");
        });
      });
    </script>
    }
    
    end 
    
    # Creates a tooltip bound to the specified element. Specify your own content
    # as the content.
    #    <div id="foo">
    #      <p>Hello world</p>
    #    </div>
    #    
    #    <%=tooltip_tag "foo", "<b>here</b> is some content" %>
    def tooltip_tag(id, content)
      %Q{<script type='text/javascript'>
        var element = $("#{id}");
      
        var content = $(document.createElement("div")); 
        content.addClassName("tooltip");
        content.innerHTML = "#{content}";
           document.body.appendChild(content);
        new Tooltip(element, content);
        </script>
      }
    end
    
    # creates a tooltip bound to the specified element using the contents of the spefied target.
    def tooltip_for_element(id, target)
      %Q{<script type='text/javascript'>
        var element = $("#{id}");
        var target = $("#{target}");
        target.addClassName("tooltip");
        new Tooltip(element, target);
        </script>
      }
    end
    
    # Creates a tooltip that displays the contents of the specified element's <tt>title</tt> attribute.
    def tooltip_for_title(id)
      %Q{
        <script type='text/javascript'>
        var element = $("#{id}");
        new Tooltip(element, element.title);
        </script>
      }
    end
   
    
  end
end