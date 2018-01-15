require "graphs/edge/strategy_factory"
require "graphs/storage/strategy_factory"

module Graphs
  class Graph
    DEFAULT_CONFIG = {
      storage_type: :list,
      edge_type: :directed,
      vertex_count: 0
    }.freeze

    def initialize(config = {})
      @config = DEFAULT_CONFIG.merge(config)
      @storage_strategy = build_storage_strategy
    end

    def add_edge(i, j)
      storage_strategy.add_edge(i, j)
    end

    def remove_edge(i, j)
      storage_strategy.remove_edge(i, j)
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

    attr_reader :storage_strategy, :config

    def build_storage_strategy
      Storage::StrategyFactory.new.for(config)
    end
  end
end
