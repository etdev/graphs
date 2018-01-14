# Strategy for adding and removing edges from an undirected matrix graph
module Graphs
  class UndirectedMatrixEdgeStrategy
    def add_edge(graph, i, j)
      graph.elements[i][j] = Storage::MatrixStrategy::HAS_VERTEX
      graph.elements[j][i] = Storage::MatrixStrategy::HAS_VERTEX
    end

    def remove_edge(graph, i, j)
      graph.elements[i][j] = Storage::MatrixStrategy::NO_VERTEX
      graph.elements[j][i] = Storage::MatrixStrategy::NO_VERTEX
    end
  end
end
