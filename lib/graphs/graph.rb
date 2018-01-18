module Graphs
  class GraphFactory
    def initialize(storage_type: :list, edge_type: :directed)
      @storage_type = storage_type
      @edge_type = edge_type
    end

    def create
      concrete_graph_class.new(edge_type: edge_type)
    end

    private

    attr_reader :storage_type, :edge_type

    def concrete_graph_class
      case storage_type
      when :list
        ListGraph
      when :matrix
        MatrixGraph
      else raise UnknownStorageTypeError
      end
    end

    class UnknownStorageTypeError < StandardError; end
  end
end
