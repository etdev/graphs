module Graphs
  module Edge
    class StrategyFactory
      def for(storage_type, edge_type)
        case storage_type
        when :matrix
          MatrixStrategy.new(edge_type: edge_type)
        when :list
          ListStrategy.new(edge_type: edge_type)
        else
          raise UnknownEdgeTypeError
        end
      end

      class UnknownEdgeTypeError < StandardError; end
    end
  end
end
