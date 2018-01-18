# Graph storage implementation using an adjacency list

# If graph has an edge at (i, j), linked list i contains a node with value j
# It not, it does not include this node

# [ 00 -> 01 -> 02 -> 03,
#   10 -> 11 -> 12 -> 13,
#   20 -> 21 -> 22 -> 23,
#   30 -> 31 -> 32 -> 33 ]

# This depends on the ListNode class
module Graphs
  class ListGraph
    include BoundsChecking

    attr_reader :elements, :vertex_count

    def initialize(edge_type: :directed)
      @edge_type = edge_type
      @vertex_count = 0
      @elements = construct_blank_graph
    end

    def add_edge(i, j)
      with_bounds_check(vertex_count, i, j) do
        elements[i].add(j)
        elements[j].add(i) if undirected?
      end
    end

    def remove_edge(i, j)
      with_bounds_check(vertex_count, i, j) do
        elements[i].remove(j)
        elements[j].remove(i) if undirected?
      end
    end

    def edge?(i, j)
      with_bounds_check(vertex_count, i, j) do
        elements[i].contains?(j)
      end
    end

    def add_vertex(add_count = 1)
      add_count.times { @elements << Components::ListNode.new }
      @vertex_count += add_count
    end

    def remove_vertex(remove_count = 1)
      return if (vertex_count - remove_count).negative?
      @elements.pop(remove_count)
      @vertex_count -= remove_count
    end

    def incident_vertices(i)
      elements[i].to_a
    end

    def to_s
      "[#{elements.map(&:to_s).join(', ')}]"
    end

    private

    attr_reader :edge_type

    def construct_blank_graph
      Array.new(0) { Components::ListNode.new }
    end

    def undirected?
      edge_type == :undirected
    end
  end
end
