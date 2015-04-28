/*

size : 960,                     // String: map width (must be set); availalbe sizes: 250, 320, 430, 540, 650, 750, 850, 960, 1280 and 1450;
tooltips : "sticky",            // String: "sticky" - display tooltip in the center of the region;
                                // String: "floating" - tooltip follows the mouse pointer; position to the cursor: "floating-top-center" (default), "floating-bottom", "floating-left", "floating-right", "floating-middle-left", "floating-bottom-right" etc;
                                // String: "hidden" - hidden tooltips;
                                // String: "visible" - always visible tooltips (can be use to show number of item in each region for example);
tooltipArrowHeight : 5,         // Integer: height of the arrow under the tooltip; is set by border-width of the .css-map li a .tooltip-arrow;
cities : false,                 // Boolean: display cities on the map;
visibleList : false,            // Boolean: show a list of regions;
visibleListContainerId : '',    // Selector: ID of the optional visible list container; must start with a hash (#) mark;
loadingText : 'Loading ...',    // String: text of the preloader; HTML tags allowed;

// Multiple Click mode
multipleClick : false,      // Boolean: Multiple Click mode;
searchUrl : 'search.php',   // String: URL to the search engine; in the Multiple Click mode search link is displayed under the map;
searchLink : 'Search',      // String: Name of the search link;
searchLinkVar : 'region',   // String: variable passing to the search engine;
searchLinkSeparator : '|',  // String: separator of the values passed to the search engine; => ?region=value1|value2|value3
clicksLimit : 0,            // Integer: limited number of clicks; 0 - unlimited clicks;
clicksLimitAlert : 'You can select only %d region! || regions!',
                             // String: error message when the clicks limit has been reached;
                             // syntax: [beginning of sentences] %d [singular] || [plural] - where %d is a number of clicks (added by script);

// List of addresses
agentsListId : '',          // Selector: ID of the list of agents/addresses; must start with a hash (#) mark;
agentsListOnHover : false,  // Boolean: show and hide agent/address on hover;
agentsListSpeed : 0,        // Integer: fade in/fade out delay in miliseconds; 0 - no fade effect;
                            // doesn't work when the agentsListOnHover mode is on;

// custom events
'onHover' : function(e){},          // Callback: function(listItem) - invoked when the mouse pointer enters a region and passing a current list item element;
'unHover' : function(e){},          // Callback: function(listItem) - invoked when the mouse pointer leaves a region and passing a current list item element;
'onClick' : function(e){},          // Callback: function(listItem) - invoked when region is clicked and passing a current list item element;
'onSecondClick' : function(e){},    // Callback: function(listItem) - invoked when region is clicked second time and passing a current list item element;
'onLoad' : function(e){}            // Callback: function(mapObject) - invoked when map is fully loaded and passing a mapObject; => $('#map-europe');

*/

$(function($){
    $('#map-europe').cssMap({'cities' : true, 'size' : 960, 'onClick': function(e){
      var link = e.children('a').attr('href'),        // get link's URL; 
          text = e.children('a').eq(0).text(),       // get text of the link; 
          className = e.attr('class').split(' ')[0];  // get class name of the list item;

          //Update div of current selected country
          document.getElementById("trends-at").textContent = "Trends at " + text;
          
          //Hits the JSON service and created the 10-trend list
          getJSON('http://localhost/~thomashenryspiteri/sw-trendack/assets/json-samples/json_trends4country.php'
          ,function(data) {
            document.getElementById("trends-list").innerHTML = 
            "<ul><li><a href='#1' onClick='trendClicked(\"" + replaceSpecialCharacters(data.trends.trend_1) + "\")'>"  
            + data.trends.trend_1 + "</a></li><li><a href='#2' onClick='trendClicked(\"" + replaceSpecialCharacters(data.trends.trend_2) + "\")'>" 
            + data.trends.trend_2 + "</a></li><li><a href='#3' onClick='trendClicked(\"" + replaceSpecialCharacters(data.trends.trend_3) + "\")'>" 
            + data.trends.trend_3 + "</a></li><li><a href='#4' onClick='trendClicked(\"" + replaceSpecialCharacters(data.trends.trend_4) + "\")'>" 
            + data.trends.trend_4 + "</a></li><li><a href='#5' onClick='trendClicked(\"" + replaceSpecialCharacters(data.trends.trend_5) + "\")'>" 
            + data.trends.trend_5 + "</a></li><li><a href='#6' onClick='trendClicked(\"" + replaceSpecialCharacters(data.trends.trend_6) + "\")'>" 
            + data.trends.trend_6 + "</a></li><li><a href='#7' onClick='trendClicked(\"" + replaceSpecialCharacters(data.trends.trend_7) + "\")'>" 
            + data.trends.trend_7 + "</a></li><li><a href='#8' onClick='trendClicked(\"" + replaceSpecialCharacters(data.trends.trend_8) + "\")'>" 
            + data.trends.trend_8 + "</a></li><li><a href='#9' onClick='trendClicked(\"" + replaceSpecialCharacters(data.trends.trend_9) + "\")'>" 
            + data.trends.trend_9 + "</a></li><li><a href='#10' onClick='trendClicked(\"" + replaceSpecialCharacters(data.trends.trend_10)+"\")'>" 
            + data.trends.trend_10 + "</a></li></ul>"; 
          },
          function(status) {
            alert('Something went wrong.'); //shit hit the fan!
          });

        }});
});

function trendClicked( mystring )
{ 
  getJSON('http://localhost/~thomashenryspiteri/sw-trendack/assets/json-samples/json_tweets4trend.php'
          ,function(data) {
            document.getElementById("tweets-for").textContent =  "Tweets for " + replaceNormalCharacters(mystring);
            
            //Clear previous tweets
            document.getElementById("tweets-list-element").innerHTML = "";

            //Load new tweets and add them to the list
            for( i = 0; i < data.tweet4trend.tweet.length; i++ )
            {
              var node = document.createElement("li");
              var textnode = document.createTextNode( data.tweet4trend.tweet[i].text );
              
              node.appendChild(textnode);
              document.getElementById("tweets-list-element").appendChild(node);
            }
          },
          function(status) {
            alert('Something went wrong.'); //in case of error
          });
}

function replaceSpecialCharacters( mystring )  
{ return mystring.replace(/#/g, "&#35;").replace(/&/g, "&amp;").replace(/>/g, "&gt;").replace(/</g, "&lt;").replace(/"/g, "&quot;"); }

function replaceNormalCharacters( mystring )
{ return mystring.replace("&#35;", "#").replace("&amp;", "&").replace("&gt;", ">").replace("&lt;", "<").replace("&quot;", "\""); }

//Not mine found it on internet to execute the HTTP
var getJSON = function(url, successHandler, errorHandler) {
  var xhr = typeof XMLHttpRequest != 'undefined'
    ? new XMLHttpRequest()
    : new ActiveXObject('Microsoft.XMLHTTP');
  xhr.open('get', url, true);
  xhr.onreadystatechange = function() {
    var status;
    var data;
    if (xhr.readyState == 4) { // `DONE`
      status = xhr.status;
      if (status == 200) {
        data = JSON.parse(xhr.responseText);
        successHandler && successHandler(data);
      } else {
        errorHandler && errorHandler(status);
      }
    }
  };
  xhr.send();
};