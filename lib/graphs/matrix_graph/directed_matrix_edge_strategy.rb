# Strategy for adding and removing edges from an undirected matrix graph
module Graphs
  class DirectedMatrixEdgeStrategy
    def add_edge(graph, i, j)
      graph.elements[i][j] = Storage::MatrixStrategy::HAS_VERTEX
    end

    def remove_edge(graph, i, j)
      graph.elements[i][j] = Storage::MatrixStrategy::NO_VERTEX
    end
  end
end
