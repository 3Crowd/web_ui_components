Web UI Components
=================
A set of reusable HTML user interface components and composable building 
blocks rendered efficiently with HTML, CSS and JavaScript for the primary 
purpose of cleaning up views regardless of templating language.

In Development Notice
---------------------
Please note that the functionality described here is a rough outline for 
development that is just starting. Do not expect that functionality described
here is implemented. Currently very little is implemented, this readme simply
serves as a roadmap for the general architecture and as an example of how the 
DSL should work.

Basic Building Blocks
---------------------
The basic building blocks of components are representations of structures, 
with associated metadata and behavior that, when composed, form complex 
components with parameterized behavior. Basic building blocks include 
semantic structures (through HTML tags) and their associated metadata, 
user provided text, and applied behavioral and stylistic markers (such 
as 'hidden', 'modal', and/or 'my_custom_style'). Built-ins for these 
basic building blocks are implemented within the Core module.

Creation of Components Through Composition
------------------------------------------
Components are completely composable and, typically, complex components 
with complex behavior are built of other components, which may be built
with other components, and so on, until those components are built entirely 
of basic building blocks, which are components that have no dependencies on 
other components. Components which have no dependencies on other components 
are known as simple components.

For example:

    # A simple component implementing the traditional tab navigation button
    class TabComponent < Component
      # A property mix-in, defined in an add-on module
      include Appearance::RoundedCorners
    
      # the simple building blocks out of which this component is based.
      # Since our primary rendering target is html, we use div and span
      # to represent the basic semantic requirements of those tags even
      # though the rendered output may not actually be those tags. Where
      # tag names are used the DSL we attempt to maintain both the semantic
      # meaning as well as the apperance.
      building_blocks do
        div :outer_wrapper do
          span :inner_wrapper do |span|
            span.text = content
          end
        end
      end
    
      variant :inactive, :default => true do
        # by default, classify the top level building block
        classify :inactive
      end

      variant :active do
        classify :active
    
        # using the `in` method we can reach back into already defined, named
        # building blocks and alter their specified properties.
        in :inner_wrapper do |span|
          span.classify :active_tab_label
        end
      end
    end
    
    # A component implementing the traditional Tab Bar
    # Looks something like when rendered into a browser:
    #  .-----.  .=========.  .-----.
    #  |  A  |  ||  *B*  ||  |  C  |
    #  -----------------------------
    # Where B is the active tab, and there are three tabs labeled
    # %w(A B C)
    class TabBarComponent < Component
    
      # ordered by default
      composed_of :tabs
    
      building_blocks do
        span :container do |span|
          # here yield captures the rendered output of your composed_of components
          # effectively wrapping them in a span building block for formatting.
          span.text = yield
        end
      end
    
      # declare style variants, if no default is set, then
      # a variant must be given when instantiating 
      variant :horizontal, :default => true do
        classify :horizontal
    
        # specify a dynamic behavior ( event(s), behavior to execute, options hash )
        # if the specified rendering method cannot display or support specified dynamic
        # behaviors or events an error is raised, unless the client acknowledges the 
        # limitation.
        on :hover_off, :hide => { :leave_partially_visible => true, :effect => { :animate => :fade_out } }
        on :hover_on, :show => { :effect => { :animate => :fade_in } }
      end

      variant :vertical do
        classify :vertical
      end
    
      # callback for when we're being rendered, after our components have rendered
      after_composed_of_render do |tab_bar|
        # activate the notify behavior if any of the tab bar's tabs are active
        behavior :notify if tab_bar.tabs.any?{|tab| tab.variant? :active }
      end
    
    end

And, using the components defined above:

    # Specify instances of and structure content, variants, etc...
    tb = TabBarComponent.new
    tb.tabs = [ TabComponent.new(:content => 'A'), 
                TabComponent.new(:content => 'B', :variant => :active), 
                TabComponent.new(:content => 'C') ]

    # Reflect on a defined clients requirements to full component specfified behavior in all variants
    TabBarComponent.rendering_requirements_for_behavior_in :browser
    => { :html => HTMLRequirements(...), :javascript => JavaScriptRequirements(...),
         :css => CSSRequirements(...), ... }

    # Provide a fully instantiated set of components to get only instance-based client-side requirements
    tb.rendering_requirements_for_behavior_in :browser
    => { :html => HTMLRequirements(...), :javascript => JavaScriptRequirements(...),
         :css => CSSRequirements(...), ... }
    
    # Do an actual render, in this case, render down components, into building blocks, into HTML
    tb.render :html, :verbose => true
    =><<-ENDOFHTML
    
      <!-- Begin rendering complex component: TabBarComponent(variant: horizontal, composed_of: TabComponent, id: 0x012344) --> 
      <span class="tab-bar-component horizontal"
             data-dynamic_behavior-event-hover_off="hide" 
             data-dynamic_behavior-event-hover_off-hide="leave_partially_visible effect"
             data-dynamic_behavior-event-hover_off-hide-effect="animate"
             data-dynamic_behavior-event-hover_off-hide-effect-animate="fade_out">
         <!-- Yielding to composed_of Components -->
           <!-- Begin rendering simple component: TabComponent(variant: inactive, id: 0x012345) -->
           <div class="tab-component inactive">
             <span>A</span>
           </div>
           <!-- End rendering simple component: TabComponent(variant: inactive, id: 0x012345) -->
           <!-- Begin rendering simple component: TabComponent(variant: active, id: 0x012346) -->
           <div class="tab-component active">
             <span class="active-tab-label">B</span>
           </div>
           <!-- End rendering simple component: TabComponent(variant: active, id: 0x012346) -->
           <!-- Begin rendering simple component: TabComponent(variant: inactive, id: 0x012347) -->
           <div class="tab-component inactive">
             <span>C</span>
           </div>
           <!-- End rendering simple component: TabComponent(variant: inactive, id: 0x012347) -->
         <!-- End yielding to composed_of Components -->
       </span>
    
       ENDOFHTML
