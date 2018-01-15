module Graphs
  module Storage
    class StrategyFactory
      def for(config)
        edge_type = config.fetch(:edge_type)

        case config.fetch(:storage_type)
        when :list
          Storage::ListStrategy.new(edge_type)
        when :matrix
          Storage::MatrixStrategy.new(edge_type)
        else raise UnknownStorageTypeError
        end
      end

      class UnknownStorageTypeError < StandardError; end
    end
  end
end
