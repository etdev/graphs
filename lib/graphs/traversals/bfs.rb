module Graphs
  module Traversals
    class BFS
      attr_reader :parents, :graph

      def initialize(graph)
        @parents = Array.new(graph.vertex_count, -1)
        @graph = graph
      end

      def run(source_idx, end_idx)
        # queue of discovered but not yet processed vertices
        q = [source_idx]
        processed = Array.new(graph.vertex_count, false)
        discovered = Array.new(graph.vertex_count, false)
        discovered[source_idx] = true

        loop do
          # return if all nodes have been processed
          return false if q.empty?

          # current vertex = oldest from queue
          v = q.shift

          # process node
          yield(v, q) if block_given?
          processed[v] = true

          # return if goal node found
          return true if v == end_idx

          # children = vertices incident to v, that have not yet been processed
          children = (0...graph.vertex_count)
            .select { |i| graph.edge?(v, i) }
            .reject { |i| discovered[i] }

          # mark discovered
          children.each do |i|
            discovered[i] = true
            @parents[i] = v
          end

          # push children onto queue
          q = q.push(*children)
        end
      end

      def shortest_path(start_idx, end_idx, path = [])
        path << end_idx
        return path.reverse if start_idx == end_idx || end_idx == -1

        shortest_path(start_idx, @parents[end_idx], path)
      end
    end
  end
end
