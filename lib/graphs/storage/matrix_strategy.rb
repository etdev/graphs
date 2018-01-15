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

      attr_reader :elements, :vertex_count

      def initialize(edge_type)
        @edge_type = edge_type
        @vertex_count = 0
        @elements = construct_blank_graph
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

      def add_vertex(add_count = 1)
        add_count.times { @elements << Array.new(vertex_count, NO_VERTEX) }
        elements.each_index do |i|
          add_count.times { @elements[i] << NO_VERTEX }
        end
        @vertex_count += add_count
      end

      def remove_vertex(remove_count = 1)
        return if (vertex_count - remove_count).negative?
        @elements.pop(remove_count)
        @vertex_count -= remove_count
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

      def construct_blank_graph
        Array.new(0) { Array.new(vertex_count, NO_VERTEX) }
      end

      def undirected?
        edge_type == :undirected
      end
    end
  end
end
