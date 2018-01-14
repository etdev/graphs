module Graphs
  class Graph
    def initialize(vertex_count, storage_type: :list, edge_type: :directed)
      @storage_strategy = StorageStrategyFactory.new.for(
        storage_type,
        vertex_count
      )
      @edge_strategy = EdgeStrategyFactory.new.for(storage_type, edge_type)
    end

    def add_edge(i, j)
      edge_strategy.add_edge(self, i, j)
    end

    def remove_edge(i, j)
      edge_strategy.remove_edge(self, i, j)
    end

    def edge?(i, j)
      storage_strategy.edge?(i, j)
    end

    def incident_vertices(i)
      storage_strategy.incident_vertices(i)
    end

    def elements
      storage_strategy.elements
    end

    def vertex_count
      storage_strategy.vertex_count
    end

    def to_s
      storage_strategy.to_s
    end

    private

    attr_reader :edge_strategy, :storage_strategy
  end
end