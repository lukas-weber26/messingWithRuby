class Tree
    attr_accessor :child_nodes, :node_name 

    def initialize(s= {})
      parent = s.keys[0]  
      children = s[parent].keys
      @child_nodes = []

      for k in children 
        child_node = {k => s[parent][k]}
        @child_nodes.push(Tree.new(child_node)) unless child_node[k] == 0
      end 

      @node_name = parent
    end
    
    def visit(&block)
      block.call self
    end 

    def visit_all(&block)
      block.call self
      child_nodes.each{ |child| child.visit_all &block }
    end 

end

myTree = Tree.new({'a' => {"b" => {}, "c" => {"d" => {}}}})

#myTree.visit {|a| puts  a.child_nodes}
myTree.visit_all {|a| puts a.node_name}

