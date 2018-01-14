module Graphs
  class StorageStrategyFactory
    def self.for(storage_type, vertex_count)
      case storage_type
      when :list then Storage::ListStrategy.new(vertex_count)
      when :matrix then Storage::MatrixStrategy.new(vertex_count)
      else raise UnknownStorageTypeError
      end
    end

    class UnknownStorageTypeError < StandardError; end
  end
end
