# Graph implementation using an adjacency matrix

# If graph has an edge at (i,j), G[i][j] == HAS_VERTEX
# If not, G[i][j] == NO_VERTEX

# [ 00, 01, 02, 03 ]
# [ 10, 11, 12, 13 ]
# [ 20, 21, 22, 23 ]
# [ 30, 31, 32, 33 ]

module Graphs
  module Storage
    class MatrixStrategy
      include BoundsChecking

      HAS_VERTEX = 1
      NO_VERTEX = 0

      attr_accessor :elements
      attr_reader :vertex_count

      def initialize(vertex_count:, edge_type:)
        @edge_type = edge_type
        @elements = construct_blank_graph(vertex_count)
        @vertex_count = vertex_count
      end

      def edge?(i, j)
        with_bounds_check(vertex_count, i, j) do
          elements[i][j] == HAS_VERTEX
        end
      end

      def add_edge(i, j)
        with_bounds_check(vertex_count, i, j) do
          elements[i][j] = HAS_VERTEX
          elements[j][i] = HAS_VERTEX if undirected?
        end
      end

      def remove_edge(i, j)
        with_bounds_check(vertex_count, i, j) do
          elements[i][j] = NO_VERTEX
          elements[j][i] = NO_VERTEX if undirected?
        end
      end

      def incident_vertices(i)
        (0...elements.size).each_with_object([]) do |j, vertices|
          vertices << j if edge?(i, j)
        end
      end

      def to_s
        elements.map(&:to_s).join("\n")
      end

      private

      attr_reader :edge_type

      def construct_blank_graph(vertex_count)
        Array.new(vertex_count) { Array.new(vertex_count, NO_VERTEX) }
      end

      def undirected?
        edge_type == :undirected
      end
    end
  end
end
