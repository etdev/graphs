module Graphs
  module Storage
    class StrategyFactory
      def for(config)
        case config.fetch(:storage_type)
        when :list
          Storage::ListStrategy.new(
            vertex_count: config.fetch(:vertex_count),
            edge_type: config.fetch(:edge_type)
          )
        when :matrix
          Storage::MatrixStrategy.new(
            vertex_count: config.fetch(:vertex_count),
            edge_type: config.fetch(:edge_type)
          )
        else raise UnknownStorageTypeError
        end
      end

      class UnknownStorageTypeError < StandardError; end
    end
  end
end
