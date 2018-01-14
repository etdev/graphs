# Strategy for adding and removing edges from an undirected matrix graph
module Graphs
  class UndirectedMatrixEdgeStrategy
    include BoundsChecking

    def add_edge(graph, i, j)
      with_bounds_check(graph, i, j) do
        graph.elements[i][j] = Storage::MatrixStrategy::HAS_VERTEX
        graph.elements[j][i] = Storage::MatrixStrategy::HAS_VERTEX
      end
    end

    def remove_edge(graph, i, j)
      with_bounds_check(graph, i, j) do
        graph.elements[i][j] = Storage::MatrixStrategy::NO_VERTEX
        graph.elements[j][i] = Storage::MatrixStrategy::NO_VERTEX
      end
    end
  end
end
