
// <!-- D3 Chart - Pie Chart -->
function pieChart() {
  var margin = {top: 30, right: 40, bottom: 130, left: 70},
      width = 960 - margin.left - margin.right,
      height = 500 - margin.top - margin.bottom,
      radius = Math.min(width, height) / 2;

  var color = d3.scale.category20();

  var pie = d3.layout.pie()
    .value(function(d) { return d.budget; })
    .sort(null);
  var arc = d3.svg.arc()
    // .innerRadius(radius - 100)
    .outerRadius(radius - 20);

  var svg = d3.select(".pie_chart").append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
      .append("g")
      .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

  d3.json(d3_url, function(error, json) {
    if (error) return console.warn(error);
      movieData = json;

      var data = [];

    for(var i=0; i<movieData.actor.movies.length; i++){
      data.push(movieData.actor.movies[i]);
      // data.push(movieData.actor.movies[i].budget);
    }
    data = data.sort(function(b, a) {return parseFloat(a.budget) - parseFloat(b.budget)});
    var topData = data.slice(0,5);
    var botData = data.slice(-5);  
console.log(data);
console.log("Top 5 Budgeted Movies: " + topData);
console.log("Bottom 5 Budgeted Movies: " + botData);

var g = svg.selectAll(".arc")
  .data(pie(topData))
  .enter().append("g")
    .attr("class", "arc")

g.append("path")
  .attr("d", arc)
  .style("fill", function(d) { return color(d.data.budget)})

g.append("text")
  .attr("dy", ".35em")
 
  .text(function(d) { return d.data.title; });
  // .attr("d", function(d) { return d(d.data.budget); })
  // .append("text")
  //       .style("text-anchor", "end")
  //       .text("Budget");
// alert(topData.length);



  var path = svg.datum(topData).selectAll("path")
      .data(pie)
    .enter().append("path")
      .attr("fill", function(d, i) { return color(i); })
      .attr("d", arc)
      .each(function(d) { this._current = d; }); // store the initial angles

  d3.selectAll("input")
      .on("change", change);

  var timeout = setTimeout(function() {
    d3.select("input[value=\"bot_budget\"]").property("checked", true).each(change);
  }, 2000);



  function change() {
    alert('hi')
    var value = botData;
    clearTimeout(timeout);
    pie.value(function(d) { return d[value]; }); // change the value function
    path = path.data(pie); // compute the new angles
    path.transition().duration(750).attrTween("d", arcTween); // redraw the arcs
  }
});

  function type(d) {
    d.budget = +d.budget;
    d.bot_budget = +d.bot_budget;
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
        alert('hi');
    };
  }

};






