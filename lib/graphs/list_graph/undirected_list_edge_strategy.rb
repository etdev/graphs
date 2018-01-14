# Strategy for adding and removing edges from an undirected List Graph
module Graphs
  class UndirectedListEdgeStrategy
    include BoundsChecking

    def add_edge(graph, i, j)
      with_bounds_check(graph, i, j) do
        graph.elements[i].add(j)
        graph.elements[j].add(i)
      end
    end

    def remove_edge(graph, i, j)
      with_bounds_check(graph, i, j) do
        graph.elements[i].remove(j)
        graph.elements[j].remove(i)
      end
    end
  end
end
