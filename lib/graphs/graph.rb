module Graphs
  class Graph
    include BoundsChecking

    attr_reader :elements, :vertex_count

    def initialize(storage_type: :list, edge_type: :directed)
      @edge_type = edge_type
      @storage_type = storage_type
      @vertex_count = 0
      @elements = construct_blank_graph
    end

    def add_vertex(add_count = 1)
      add_count.times { elements << vertex_list_class.new }

      elements.each_index do |i|
        add_count.times { elements[i].add_blank }
      end

      @vertex_count += add_count
    end

    def add_edge(i, j)
      with_bounds_check(vertex_count, i, j) do
        elements[i].add(j)
        elements[j].add(i) if undirected?
      end
    end

    def remove_edge(i, j)
      with_bounds_check(vertex_count, i, j) do
        elements[i].remove(j)
        elements[j].remove(i) if undirected?
      end
    end

    def edge?(i, j)
      with_bounds_check(vertex_count, i, j) do
        elements[i].contains?(j)
      end
    end

    def incident_vertices(i)
      elements[i].to_a
    end

    def remove_vertex(remove_count = 1)
      return if (vertex_count - remove_count).negative?
      @elements.pop(remove_count)
      @vertex_count -= remove_count
    end

    def to_s
      elements.map(&:to_s).join("\n")
    end

    def construct_blank_graph
      Array.new(0) { vertex_list_class }
    end

    protected

    attr_reader :edge_type, :storage_type

    def vertex_list_class
      case storage_type
      when :list
        Components::ListNode
      when :matrix
        Components::ArrayVertexList
      end
    end

    def undirected?
      edge_type == :undirected
    end
  end
end
