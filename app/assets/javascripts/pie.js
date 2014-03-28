// <!-- D3 Chart - Pie Chart -->
function pieChart() {
  var margin = {top: 0, right: 0, bottom: 0, left: -140},
      width = 1250 - margin.left - margin.right,
      height = 500 - margin.top - margin.bottom,
      radius = Math.min(width, height) / 2;

  var color = d3.scale.category20();

  var pie = d3.layout.pie()
    .value(function(d) { return d.budget; })
    .sort(null);
  var arc = d3.svg.arc()
    .innerRadius(radius - 250)
    .outerRadius(radius - 20);

  var tip = d3.tip()
    .attr('class', 'd3-tip')
    .offset([-10, 0])
    .html(function(d) {
      return "<strong></strong> <span style='color:#4d4d4d'>" + d.data.title + "</span>";
    })

  var svg = d3.select(".pie_chart").append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
      .append("g")
      .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

svg.call(tip);

  d3.json(d3_url, function(error, json) {
    if (error) return console.warn(error);
      movieData = json;

      var data = [];

    for(var i=0; i<movieData.actor.movies.length; i++){
      data.push(movieData.actor.movies[i]);
    }

    data = data.sort(function(b, a) {return parseFloat(a.budget) - parseFloat(b.budget)});
    var topData = data.slice(0,5);
    var botData = data.slice(-5);  

var g = svg.selectAll(".arc")
  .data(pie(topData))
  .enter().append("g")
    .attr("class", "arc")
    .on('mouseover', tip.show)
    .on('mouseout', tip.hide);

g.append("path")
  .attr("d", arc)
  .style("fill", function(d) { return color(d.data.budget);
  });

g.append("text")
  .attr("transform", function(d) { 
    return "translate(" + arc.centroid(d) + ")"; })
  .attr("dy", ".35em")
  .style("text-anchor", "middle" )
  .text(function(d, i) { return "$" + (data[i].budget.toString()).slice(0, -6) + "m"; });

// d3.json(d3_url, function(error, json) {
var path = svg.datum(botData).selectAll("path")
    .data(pie)
  .enter().append("path")
    .attr("fill", function(d, i) { return color(i); })
    .attr("d", arc)
    .each(function(d) { this._current = d; }); // store the initial angles
console.log("1:" + path)
  d3.selectAll("input")
    .on("change", change);

  var timeout = setTimeout(function() {
    d3.select("input[value=\"botData\"]").property("checked", true).each(change);
  }, 2000);



  function change() {
    var value = this.value;
    console.log("value: " + value);
    clearTimeout(timeout);
    pie.value(function(d) { return d[value]; }); // change the value function
    path = path.data(pie); // compute the new angles
    console.log("path: " + path)
    path.transition().duration(750).attrTween("d", arcTween); // redraw the arcs
  }
});

  function type(d) {
    d.topData = +d.topData;
    d.botData = +d.botData;
    return d;
  }
  // Store the displayed angles in _current.
  // Then, interpolate from _current to the new angles.
  // During the transition, _current is updated in-place by d3.interpolate.
  function arcTween(a) {
    var i = d3.interpolate(this._current, a);
    this._current = i(0);
    return function(t) {
      return arc(i(t));
        
    };
  };

};