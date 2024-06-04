class Tree
  attr_accessor :children, :node_name

  def initialize(name)
    @children = []
    @node_name = name
  end

  def add_child(child)
    @children << child
  end

  def visit_all(&block)
    visit &block
    @children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

def make_tree_from_input(hash)
  root_name, root_children = hash.first
  root_tree = Tree.new(root_name)
  make_tree(root_tree, hash[root_name])
  root_tree 
end

def make_tree(root_tree,children)
  children.each do |name, child|
    child_node = Tree.new(name)
    root_tree.add_child(child_node)
    make_tree(root_tree,child) if child.is_a?(Hash)
  end
end

tree = make_tree_from_input(
  'grand' => {
    'dad' => {
      'child1' => {},
      'child2' => {}
    },
    'uncle' => {
      'child3' => {},
      'child4' => {}
    }
  }
)

tree.visit_all { |node| puts node.node_name }
