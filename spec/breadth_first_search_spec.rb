describe Graphs::Traversals::BFS do
  before do
    @graph = Graphs::Graph.new
    @graph.add_vertex(5)
    @graph.add_edge(0, 1)
    @graph.add_edge(1, 3)
    @graph.add_edge(3, 4)
  end

  describe "run" do
    it "runs block for elements in correct order" do
      bfs = Graphs::Traversals::BFS.new(@graph)
      expect { bfs.run(0, 4) { |v| puts v } }
        .to output("0\n1\n3\n4\n")
        .to_stdout
    end

    it "stores correct shortest path" do
      bfs = Graphs::Traversals::BFS.new(@graph)
      bfs.run(0, 4)
      expect(bfs.shortest_path(0, 4)).to eq([0,1,3,4])
    end
  end
end
