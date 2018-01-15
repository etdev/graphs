# Graph storage implementation using an adjacency list

# If graph has an edge at (i, j), linked list i contains a node with value j
# It not, it does not include this node

# [ 00 -> 01 -> 02 -> 03,
#   10 -> 11 -> 12 -> 13,
#   20 -> 21 -> 22 -> 23,
#   30 -> 31 -> 32 -> 33 ]

# This depends on the ListNode class
module Graphs
  module Storage
    class ListStrategy
      include BoundsChecking

      attr_accessor :elements
      attr_reader :vertex_count

      def initialize(vertex_count:, edge_type:)
        @elements = construct_blank_graph(vertex_count)
        @vertex_count = vertex_count
        @edge_type = edge_type
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

      def incident_vertices(i)
        elements[i].to_a
      end

      def to_s
        "[#{elements.map(&:to_s).join(', ')}]"
      end

      private

      attr_reader :edge_type

      def construct_blank_graph(vertex_count)
        Array.new(vertex_count) { Components::ListNode.new }
      end

      def undirected?
        edge_type == :undirected
      end
    end
  end
end
