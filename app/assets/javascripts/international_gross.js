
<!-- D3 Chart - International Gross -->

function toggle_intl() {
  var margin = {top: 30, right: 50, bottom: 130, left: 100},
      width = 1400 - margin.left - margin.right,
      height = 500 - margin.top - margin.bottom;

  var x = d3.scale.ordinal()
      .rangeRoundBands([0, width], .1);

  var y = d3.scale.linear()
      .range([height, 0]);

  var xAxis = d3.svg.axis()
      .scale(x)
      .orient("bottom");

  var yAxis = d3.svg.axis()
      .scale(y)
      .orient("left")
      .ticks(10);

  var tip = d3.tip()
    .attr('class', 'd3-tip')
    .offset([-10, 0])
    .html(function(d) {
      return "<strong>Revenue:</strong> <span style='color:red'>" +  formatNumber(d.total_revenue) + "</span>";
    })

  var svg = d3.select(".chart").append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
      .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

  svg.call(tip);

  d3.json(d3_url, function(error, json) {
    if (error) return console.warn(error);
      actor = json;
      var data = [];
    for(var i=0; i<actor.actor.movies.length; i++){
      data.push(actor.actor.movies[i]);
    }
   
    x.domain(data.map(function(d) { return d.title; }));
    y.domain([0, d3.max(data, function(d) { return d.total_revenue; })]);

    svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis)
      .selectAll("text")  
            .style("text-anchor", "end")
            .attr("dx", "-.8em")
            .attr("dy", ".15em")
            .attr("transform", function(d) {
              return "rotate(-45)" 
            });
     
    svg.append("g")
        .attr("class", "y axis")
        .call(yAxis)
      .append("text")
        .attr("transform", "rotate(-90)")
        .attr("y", 6)
        .attr("dy", ".71em")
        .style("text-anchor", "end")
        .text("International Revenue");
    svg.selectAll(".bar")
        .data(data)
      .enter().append("rect")
        .attr("class", "bar")
        .attr("x", function(d) { return x(d.title); })
        .attr("width", x.rangeBand())
        .attr("y", function(d) { return y(d.international_revenue); })
        .attr("height", function(d) { return height - y(d.international_revenue); })
        .on('mouseover', tip.show)
        .on('mouseout', tip.hide);

  var mySquare =  svg.selectAll("rect")
    .attr("height", 0)
    .transition()
    // .attr("x", function(d) { return height - y(d.usa_revenue); })
    .attr("height", function(d) { return height - y(d.usa_revenue); })
      .duration(2000);
      // .delay(10);
  function type(d) {
      d.international_revenue = +d.international_revenue;
    return d;
    }
  });
}