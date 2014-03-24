  var r = 800, // setting this up as a "side" for our canvas
        format = d3.format(",d"), // formats as integer
        fill = d3.scale.category10(); // colors by ordinal scale

    var bubble = d3.layout.pack() // pack layout lends to bubble chart
        .sort(null) // runs a comparator if you want to do some sorting (we aren't here)
        .size([r, r]) // defaults to 1x1 unless this is specified [x, y]
        .padding(2); // how much space between each bubble

    var vis = d3.select("#bubblechart").append("svg") // puts a svg inside of the div with an id of "chart"
        .attr("width", r) // svg canvas is r wide
        .attr("height", r) // svg canvas is r tall (it's a square)
        .attr("class", "bubble"); // add class "bubble" to svg



      var node = vis.selectAll("g.node") // setting up nodes with a select within the svg we set up when we declared vis above
          .data(bubble.nodes(classes(json)) // looks more complex than it is -- we're flattening stuff via bubble (above) and classes (below)
          .filter(function(d) { return !d.children; }))
        .enter().append("g") // g is a D3 thing that groups svg shapes
          .attr("class", "node")
          .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; }); // this gives us the spiraling effect of the bubbles by translating the position (x,y) of each next node

      node.append("title") // adds a title attribute to each node -- here, it populates that with the string, "My favorite flavor is ___" and incorporates the flavor of each node
          .text(function(d) { return "My favorite flavor is " + d.className; });

      node.append("circle") // makes these visuals bubbles
          .attr("r", function(d) { return d.r; }) // sets the radius of each bubble
          .style("fill", function(d) { return fill(d.packageName); }); // fills the bubble with the color appropriate to the package

      node.append("text") 
          .attr("text-anchor", "middle") // places font in middle of node
          .attr("dy", ".3em") // sizes font
          .text(function(d) { return d.className; }); // text is equal to name

    // Awesome function courtesy of Mike Bostock/Jeff Heer
    // Returns a flattened hierarchy containing all leaf nodes under the root.
    function classes(root) {
      var classes = [];

      function recurse(flavor, node) {
        if (node.children) node.children.forEach(function(child) { recurse(node.flavor, child); });
        else classes.push({packageName: flavor, className: node.flavor, value: node.size});
      }

      recurse(null, root);
      return {children: classes};
    }