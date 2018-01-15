# Strategy for adding and removing edges from an undirected List Graph
module Graphs
  module Edge
    class ListStrategy
      include BoundsChecking

      def initialize(edge_type: :directed)
        @edge_type = edge_type
      end

      def add_edge(graph, i, j)
        with_bounds_check(graph, i, j) do
          graph.elements[i].add(j)
          graph.elements[j].add(i) if undirected?
        end
      end

      def remove_edge(graph, i, j)
        with_bounds_check(graph, i, j) do
          graph.elements[i].remove(j)
          graph.elements[j].remove(i) if undirected?
        end
      end

      private

      attr_reader :edge_type

      def undirected?
        edge_type == :undirected
      end
    end
  end
end
