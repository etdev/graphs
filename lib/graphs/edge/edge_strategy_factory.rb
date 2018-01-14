module Graphs
  module Edge
    class EdgeStrategyFactory
      def for(storage_type, edge_type)
        case storage_type
        when :matrix
          MatrixEdgeStrategy.new(edge_type: edge_type)
        when :list
          ListEdgeStrategy.new(edge_type: edge_type)
        else
          raise UnknownEdgeTypeError
        end
      end

      class UnknownEdgeTypeError < StandardError; end
    end
  end
end
