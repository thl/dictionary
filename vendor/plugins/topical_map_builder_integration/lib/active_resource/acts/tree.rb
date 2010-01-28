module ActiveResource
  module Acts
    module Tree
      def self.included(base)
        base.extend(ClassMethods)
      end

      # Specify this +acts_as+ extension if you want to model a tree structure by providing a parent association and a children
      # association. This requires that you have a foreign key column, which by default is called +parent_id+.
      #
      #   class Category < ActiveResource::Base
      #     site = http://xxx
      #     acts_as_active_resource_tree
      #   end
      #
      #   Example:
      #   root
      #    \_ child1
      #         \_ subchild1
      #         \_ subchild2
      #
      #   root      = Category.create(:name => 'root')
      #   child1    = Category.create(:name => 'child1', :parent_id => root.id )
      #   subchild1 = Category.create(:name => 'subchild1', :parent_id => child1.id)
      #
      #   root.parent   # => nil
      #   child1.parent # => root
      #   root.children # => [child1]
      #   root.children.first.children.first # => subchild1
      #
      # In addition to the parent and children associations, the following instance methods are added to the class
      # after calling <tt>acts_as_active_resource_tree</tt>:
      # * <tt>siblings</tt> - Returns all the children of the parent, excluding the current node (<tt>[subchild2]</tt> when called on <tt>subchild1</tt>)
      # * <tt>self_and_siblings</tt> - Returns all the children of the parent, including the current node (<tt>[subchild1, subchild2]</tt> when called on <tt>subchild1</tt>)
      # * <tt>ancestors</tt> - Returns all the ancestors of the current node (<tt>[child1, root]</tt> when called on <tt>subchild2</tt>)
      # * <tt>root</tt> - Returns the root of the current node (<tt>root</tt> when called on <tt>subchild2</tt>)
      module ClassMethods
        # Configuration options are:
        #
        # * <tt>foreign_key</tt> - specifies the column name to use for tracking of the tree (default: +parent_id+)
        # * <tt>order</tt> - makes it possible to sort the children according to this SQL snippet.
        # * <tt>counter_cache</tt> - keeps a count in a +children_count+ column if set to +true+ (default: +false+).
        def acts_as_active_resource_tree
          class_eval <<-EOV
            include ActiveResource::Acts::Tree::InstanceMethods

            def self.roots
              find(:all, :params => { :parent_id => nil })
            end

            def self.root
              find(:first, :params => { :parent_id => nil })
            end
          EOV
        end
      end

      module InstanceMethods
        def parent
          @parent ||= self.class.find(self.parent_id)
        end
        
        def children
          @children ||= self.class.find(:all, :params => {:parent_id => self.id})
        end
        
        # Returns list of ancestors, starting from parent until root.
        #
        #   subchild1.ancestors # => [child1, root]
        def ancestors
          return @ancestors if @ancestors
          node, nodes = self, []
          nodes << node = node.parent while node.parent
          @ancestors = nodes
        end

        # Returns the root node of the tree.
        def root
          return @root if @root
          node = self
          node = node.parent while node.parent
          @root = node
        end

        # Returns all siblings of the current node.
        #
        #   subchild1.siblings # => [subchild2]
        def siblings
          @siblings ||= self_and_siblings - [self]
        end

        # Returns all siblings and a reference to the current node.
        #
        #   subchild1.self_and_siblings # => [subchild1, subchild2]
        def self_and_siblings
          @self_and_siblings ||= parent ? parent.children : self.class.roots
        end
      end
    end
  end
end