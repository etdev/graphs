# Strategy for adding and removing edges from an undirected list graph
module Graphs
  class DirectedListEdgeStrategy
    include BoundsChecking

    def add_edge(graph, i, j)
      with_bounds_check(graph, i, j) do
        graph.elements[i].add(j)
      end
    end

    def remove_edge(graph, i, j)
      with_bounds_check(graph, i, j) do
        graph.elements[i].remove(j)
      end
    end
  end
end
