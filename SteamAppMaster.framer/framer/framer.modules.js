require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"dbRequestsModule":[function(require,module,exports){

/*

This Module is designed to hold all functions that interact with our
Parse.js back-end. This includes the User, Session, Criteria,
Questions, and Games requests (note some have GET as well as POST
functionality!).
 */
var criteriaList;

criteriaList = new ScrollComponent({
  superLayer: stageOne,
  backgroundColor: "transparent",
  x: 50,
  y: 175,
  width: 1340,
  height: 700
});

criteriaList.scrollVertical = false;

exports.postUser = function() {
  var postUserParams;
  postUserParams = {
    'uri': '/v1/users/12345',
    'verb': 'POST',
    'body': {
      'steam_account_name': 'Petraclezzz'
    }
  };
  return Parse.Cloud.run('serve', postUserParams, {
    success: function(results) {
      print("FUCK YA");
      return print(results);
    },
    error: function(err) {
      return print(err);
    }
  });
};

exports.getUser = function() {
  var getUserParams;
  getUserParams = {
    'uri': '/v1/users/DdOBG6MuKb',
    'verb': 'GET'
  };
  return Parse.Cloud.run('serve', getUserParams, {
    success: function(results) {
      return print(results);
    },
    error: function(err) {
      return print(err);
    }
  });
};

exports.getCriteria = function() {
  var getCriteriaParams;
  getCriteriaParams = {
    uri: "/v1/criteria",
    verb: "GET"
  };
  return Parse.Cloud.run('serve', getCriteriaParams, {
    success: function(results) {
      var criteria, i, k, len, result, results1;
      i = 0;
      results1 = [];
      for (k = 0, len = results.length; k < len; k++) {
        result = results[k];
        criteria = new Layer({
          superLayer: criteriaList.content,
          image: result.icon_url,
          name: "Criteria_" + result.name,
          opacity: 0,
          width: 650,
          height: 550,
          x: i * 650,
          y: 175
        });
        criteria.animate({
          properties: {
            opacity: 1
          },
          time: 2.25
        });
        i++;
        results1.push(criteria.on(Events.Click, addCriteria));
      }
      return results1;
    },
    error: function(err) {
      return print("Could not GET Criteria!");
    }
  });
};

exports.getQuestions = function() {
  var getQuestionsParams;
  getQuestionsParams = {
    uri: "/v1/questions",
    verb: "GET"
  };
  return Parse.Cloud.run('serve', getQuestionsParams, {
    success: function(result) {
      var i, j, k, l, len, len1, question, questionBox, ref, ref1, response, responseBox, results1;
      result = result[0];
      i = 0;
      ref = result.questions;
      results1 = [];
      for (k = 0, len = ref.length; k < len; k++) {
        question = ref[k];
        questionBox = new Layer({
          superLayer: stageTwo,
          name: "Question_" + i,
          opacity: 1,
          backgroundColor: "lightgray",
          borderRadius: 20,
          y: i * 150 + 350,
          width: 1000,
          height: 80,
          html: question.text
        });
        questionBox.animate({
          properties: {
            opacity: 1
          },
          time: 2.25
        });
        questionBox.style = {
          "color": "black",
          "text-align": "center",
          "font-size": "120%",
          "padding-top": "25px"
        };
        questionBox.centerX();
        j = 0;
        ref1 = question.responses;
        for (l = 0, len1 = ref1.length; l < len1; l++) {
          response = ref1[l];
          responseBox = new Layer({
            superLayer: stageTwo,
            name: "Response_" + j,
            backgroundColor: "darkgray",
            borderRadius: 20,
            opacity: 0,
            y: 450,
            x: j * 250 + 250,
            width: 200,
            height: 80,
            html: response.text
          });
          responseBox.style = {
            "color": "black",
            "text-align": "center",
            "font-size": "120%",
            "padding-top": "25px"
          };
          responseBox.animate({
            properties: {
              opacity: 1
            },
            time: 2.25
          });
          responseBox.on(Events.Click, addAnswer);
          j++;
        }
        results1.push(i++);
      }
      return results1;
    },
    error: function(err) {
      return print("Error: Questions could not be retrieved");
    }
  });
};

exports.getResults = function() {
  var getResultsBoxParams;
  getResultsBoxParams = {
    uri: "/v1/users/DdOBG6MuKb/session",
    verb: "GET"
  };
  return Parse.Cloud.run('serve', getResultsBoxParams, {
    success: function(result) {
      var game, gameResult, i, k, len, ref, results1;
      i = 0;
      ref = result.games;
      results1 = [];
      for (k = 0, len = ref.length; k < len; k++) {
        game = ref[k];
        gameResult = new Layer({
          superLayer: resultsList.content,
          image: game.box_art_url,
          name: "Game_" + game.name,
          opacity: 0,
          width: 600,
          height: 200,
          x: i * 650,
          y: 250,
          html: game.name
        });
        gameResult.style = {
          "text-align": "center"
        };
        gameResult.animate({
          properties: {
            opacity: 1
          },
          time: 2.25
        });
        i++;
        results1.push(gameResult.on(Events.Click, function() {
          return showDetailsBlurb(this);
        }));
      }
      return results1;
    },
    error: function(err) {
      return print("Error: current Session Results could not be retrieved!");
    }
  });
};


},{}]},{},[])
//# sourceMappingURL=data:application/json;charset:utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIm5vZGVfbW9kdWxlcy9icm93c2VyaWZ5L25vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiLCIvVXNlcnMvZHVubnkvRG9jdW1lbnRzL0dpdEh1Yi9TdGVhbUFwcC9TdGVhbUFwcE1hc3Rlci5mcmFtZXIvbW9kdWxlcy9kYlJlcXVlc3RzTW9kdWxlLmNvZmZlZSJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiQUFBQTs7QUNBQTs7Ozs7OztBQUFBLElBQUE7O0FBU0EsWUFBQSxHQUFtQixJQUFBLGVBQUEsQ0FDbEI7RUFBQSxVQUFBLEVBQVksUUFBWjtFQUNBLGVBQUEsRUFBaUIsYUFEakI7RUFFQSxDQUFBLEVBQUcsRUFGSDtFQUdBLENBQUEsRUFBRyxHQUhIO0VBSUEsS0FBQSxFQUFPLElBSlA7RUFLQSxNQUFBLEVBQVEsR0FMUjtDQURrQjs7QUFPbkIsWUFBWSxDQUFDLGNBQWIsR0FBOEI7O0FBRzlCLE9BQU8sQ0FBQyxRQUFSLEdBQW1CLFNBQUE7QUFFbEIsTUFBQTtFQUFBLGNBQUEsR0FDQztJQUFBLEtBQUEsRUFBUSxpQkFBUjtJQUNBLE1BQUEsRUFBUyxNQURUO0lBRUEsTUFBQSxFQUNDO01BQUEsb0JBQUEsRUFBdUIsYUFBdkI7S0FIRDs7U0FLRCxLQUFLLENBQUMsS0FBSyxDQUFDLEdBQVosQ0FBZ0IsT0FBaEIsRUFBeUIsY0FBekIsRUFDQztJQUFBLE9BQUEsRUFBUyxTQUFDLE9BQUQ7TUFDUixLQUFBLENBQU0sU0FBTjthQUNBLEtBQUEsQ0FBTSxPQUFOO0lBRlEsQ0FBVDtJQUdBLEtBQUEsRUFBTyxTQUFDLEdBQUQ7YUFDTixLQUFBLENBQU0sR0FBTjtJQURNLENBSFA7R0FERDtBQVJrQjs7QUFnQm5CLE9BQU8sQ0FBQyxPQUFSLEdBQWtCLFNBQUE7QUFFakIsTUFBQTtFQUFBLGFBQUEsR0FDQztJQUFBLEtBQUEsRUFBTyxzQkFBUDtJQUNBLE1BQUEsRUFBUSxLQURSOztTQUdELEtBQUssQ0FBQyxLQUFLLENBQUMsR0FBWixD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UDtVQUtBLE1BQUEsRUFBUSxHQUxSO1VBTUEsQ0FBQSxFQUFHLENBQUEsR0FBSSxHQU5QO1VBT0EsQ0FBQSxFQUFHLEdBUEg7VUFRQSxJQUFBLEVBQU0sSUFBSSxDQUFDLElBUlg7U0FEZ0I7UUFVakIsVUFBVSxDQUFDLEtBQVgsR0FDQztVQUFBLFlBQUEsRUFBYSxRQUFiOztRQUNELFVBQVUsQ0FBQyxPQUFYLENBQ0M7VUFBQSxVQUFBLEVBQ0M7WUFBQSxPQUFBLEVBQVMsQ0FBVDtXQUREO1VBRUEsSUFBQSxFQUFNLElBRk47U0FERDtRQUlBLENBQUE7c0JBQ0EsVUFBVSxDQUFDLEVBQVgsQ0FBYyxNQUFNLENBQUMsS0FBckIsRUFBNEIsU0FBQTtpQkFBRyxnQkFBQSxDQUFpQixJQUFqQjtRQUFILENBQTVCO0FBbEJEOztJQUhRLENBQVQ7SUFzQkEsS0FBQSxFQUFPLFNBQUMsR0FBRDthQUNOLEtBQUEsQ0FBTSx3REFBTjtJQURNLENBdEJQO0dBREQ7QUFMb0IiLCJmaWxlIjoiZ2VuZXJhdGVkLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXNDb250ZW50IjpbIihmdW5jdGlvbiBlKHQsbixyKXtmdW5jdGlvbiBzKG8sdSl7aWYoIW5bb10pe2lmKCF0W29dKXt2YXIgYT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2lmKCF1JiZhKXJldHVybiBhKG8sITApO2lmKGkpcmV0dXJuIGkobywhMCk7dmFyIGY9bmV3IEVycm9yKFwiQ2Fubm90IGZpbmQgbW9kdWxlICdcIitvK1wiJ1wiKTt0aHJvdyBmLmNvZGU9XCJNT0RVTEVfTk9UX0ZPVU5EXCIsZn12YXIgbD1uW29dPXtleHBvcnRzOnt9fTt0W29dWzBdLmNhbGwobC5leHBvcnRzLGZ1bmN0aW9uKGUpe3ZhciBuPXRbb11bMV1bZV07cmV0dXJuIHMobj9uOmUpfSxsLGwuZXhwb3J0cyxlLHQsbixyKX1yZXR1cm4gbltvXS5leHBvcnRzfXZhciBpPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7Zm9yKHZhciBvPTA7bzxyLmxlbmd0aDtvKyspcyhyW29dKTtyZXR1cm4gc30pIiwiIyMjXG5cblRoaXMgTW9kdWxlIGlzIGRlc2lnbmVkIHRvIGhvbGQgYWxsIGZ1bmN0aW9ucyB0aGF0IGludGVyYWN0IHdpdGggb3VyXG5QYXJzZS5qcyBiYWNrLWVuZC4gVGhpcyBpbmNsdWRlcyB0aGUgVXNlciwgU2Vzc2lvbiwgQ3JpdGVyaWEsXG5RdWVzdGlvbnMsIGFuZCBHYW1lcyByZXF1ZXN0cyAobm90ZSBzb21lIGhhdmUgR0VUIGFzIHdlbGwgYXMgUE9TVFxuZnVuY3Rpb25hbGl0eSEpLlxuXG4jIyNcblxuY3JpdGVyaWFMaXN0ID0gbmV3IFNjcm9sbENvbXBvbmVudFxuXHRzdXBlckxheWVyOiBzdGFnZU9uZVxuXHRiYWNrZ3JvdW5kQ29sb3I6IFwidHJhbnNwYXJlbnRcIlxuXHR4OiA1MFxuXHR5OiAxNzVcblx0d2lkdGg6IDEzNDBcblx0aGVpZ2h0OiA3MDBcbmNyaXRlcmlhTGlzdC5zY3JvbGxWZXJ0aWNhbCA9IGZhbHNlXG5cbiMgTWFrZSBhIFN0ZWFtQXBwIFVzZXJcbmV4cG9ydHMucG9zdFVzZXIgPSAtPlxuXHQjIE1ha2UgdGhlIHBhcmFtZXRlcnMgZm9yIHRoZSByZXF1ZXN0LCB0aGVuIG1ha2UgdGhlIHJlcXVlc3Rcblx0cG9zdFVzZXJQYXJhbXMgPSBcblx0XHQndXJpJyA6ICcvdjEvdXNlcnMvMTIzNDUnXG5cdFx0J3ZlcmInIDogJ1BPU1QnXG5cdFx0J2JvZHknIDpcblx0XHRcdCdzdGVhbV9hY2NvdW50X25hbWUnIDogJ1BldHJhY2xlenp6J1xuXHRcblx0UGFyc2UuQ2xvdWQucnVuICdzZXJ2ZScsIHBvc3RVc2VyUGFyYW1zLFxuXHRcdHN1Y2Nlc3M6IChyZXN1bHRzKSAtPlxuXHRcdFx0cHJpbnQgXCJGVUNLIFlBXCJcblx0XHRcdHByaW50IHJlc3VsdHNcblx0XHRlcnJvcjogKGVycikgLT5cblx0XHRcdHByaW50KGVycilcblxuIyBHZXQgYSBTdGVhbUFwcCBVc2VyXG5leHBvcnRzLmdldFVzZXIgPSAtPlxuXHQjIE1ha2UgdGhlIHBhcmFtZXRlcnMgZm9yIHRoZSByZXF1ZXN0LCB0aGVuIG1ha2UgdGhlIHJlcXVlc3Rcblx0Z2V0VXNlclBhcmFtcyA9IFxuXHRcdCd1cmknOiAnL3YxL3VzZXJzL0RkT0JHNk11S2InXG5cdFx0J3ZlcmInOiAnR0VUJ1xuXHRcblx0UGFyc2UuQ2xvdWQucnVuICdzZXJ2ZScsIGdldFVzZXJQYXJhbXMsXG5cdFx0c3VjY2VzczogKHJlc3VsdHMpIC0+XG5cdFx0XHRwcmludCByZXN1bHRzXG5cdFx0ZXJyb3I6IChlcnIpIC0+XG5cdFx0XHRwcmludChlcnIpXG5cbiMgUmV0cmlldmUgYWxsIENyaXRlcmlhIGZvciB0aGUgVXNlciB0byBzZWxlY3QgZnJvbTpcbmV4cG9ydHMuZ2V0Q3JpdGVyaWEgPSAtPlxuXHQjIE1ha2UgdGhlIHBhcmFtZXRlcnMgZm9yIHRoZSByZXF1ZXN0LCB0aGVuIG1ha2UgdGhlIHJlcXVlc3Rcblx0Z2V0Q3JpdGVyaWFQYXJhbXMgPSBcblx0XHR1cmk6IFwiL3YxL2NyaXRlcmlhXCJcblx0XHR2ZXJiOiBcIkdFVFwiXG5cdFxuXHRQYXJzZS5DbG91ZC5ydW4gJ3NlcnZlJywgZ2V0Q3JpdGVyaWFQYXJhbXMsXG5cdFx0c3VjY2VzczogKHJlc3VsdHMpIC0+XG5cdFx0XHRpID0gMFxuXHRcdFx0IyBMb29wIGFuZCBhZGQgY3JlYXRlIHRoZSBDcml0ZXJpYSBRdWVzdGlvbnMgb2JqZWN0c1xuXHRcdFx0Zm9yIHJlc3VsdCBpbiByZXN1bHRzXG5cdFx0XHRcdGNyaXRlcmlhID0gbmV3IExheWVyXG5cdFx0XHRcdFx0c3VwZXJMYXllcjogY3JpdGVyaWFMaXN0LmNvbnRlbnRcblx0XHRcdFx0XHRpbWFnZTogcmVzdWx0Lmljb25fdXJsXG5cdFx0XHRcdFx0bmFtZTogXCJDcml0ZXJpYV9cIiArIHJlc3VsdC5uYW1lXG5cdFx0XHRcdFx0b3BhY2l0eTogMFxuXHRcdFx0XHRcdHdpZHRoOiA2NTBcblx0XHRcdFx0XHRoZWlnaHQ6IDU1MFxuXHRcdFx0XHRcdHg6IGkgKiA2NTBcblx0XHRcdFx0XHR5OiAxNzVcblx0XHRcdFx0Y3JpdGVyaWEuYW5pbWF0ZVxuXHRcdFx0XHRcdHByb3BlcnRpZXM6XG5cdFx0XHRcdFx0XHRvcGFjaXR5OiAxXG5cdFx0XHRcdFx0dGltZTogMi4yNVxuXHRcdFx0XHRpKytcblx0XHRcdFx0Y3JpdGVyaWEub24gRXZlbnRzLkNsaWNrLCBhZGRDcml0ZXJpYVxuXHRcdGVycm9yOiAoZXJyKSAtPlxuXHRcdFx0cHJpbnQoXCJDb3VsZCBub3QgR0VUIENyaXRlcmlhIVwiKVxuXG4jIFJldHJpZXZlIGFsbCBRdWVzdGlvbnMgZm9yIHRoZSBVc2VyIGJhc2VkIG9uIHByZXZpb3VzbHkgc2VsZWN0ZWQgQ3JpdGVyaWE6XG5leHBvcnRzLmdldFF1ZXN0aW9ucyA9IC0+XG5cdCMgTWFrZSB0aGUgcGFyYW1ldGVycyBmb3IgdGhlIHJlcXVlc3QsIHRoZW4gbWFrZSB0aGUgcmVxdWVzdFxuXHRnZXRRdWVzdGlvbnNQYXJhbXMgPSBcblx0XHR1cmk6IFwiL3YxL3F1ZXN0aW9uc1wiXG5cdFx0dmVyYjogXCJHRVRcIlxuXHRcblx0UGFyc2UuQ2xvdWQucnVuICdzZXJ2ZScsIGdldFF1ZXN0aW9uc1BhcmFtcyxcblx0XHRzdWNjZXNzOiAocmVzdWx0KSAtPlxuXHRcdFx0cmVzdWx0ID0gcmVzdWx0WzBdXG5cdFx0XHQjIENyZWF0ZSB0aGUgUXVlc3Rpb24gQm94ZXNcblx0XHRcdGkgPSAwXG5cdFx0XHRmb3IgcXVlc3Rpb24gaW4gcmVzdWx0LnF1ZXN0aW9uc1xuXHRcdFx0XHRxdWVzdGlvbkJveCA9IG5ldyBMYXllclxuXHRcdFx0XHRcdHN1cGVyTGF5ZXI6IHN0YWdlVHdvXG5cdFx0XHRcdFx0bmFtZTogXCJRdWVzdGlvbl9cIiArIGlcblx0XHRcdFx0XHRvcGFjaXR5OiAxXG5cdFx0XHRcdFx0YmFja2dyb3VuZENvbG9yOiBcImxpZ2h0Z3JheVwiXG5cdFx0XHRcdFx0Ym9yZGVyUmFkaXVzOiAyMFxuXHRcdFx0XHRcdHk6IGkgKiAxNTAgKyAzNTBcblx0XHRcdFx0XHR3aWR0aDogMTAwMFxuXHRcdFx0XHRcdGhlaWdodDogODBcblx0XHRcdFx0XHRodG1sOiBxdWVzdGlvbi50ZXh0XG5cdFx0XHRcdHF1ZXN0aW9uQm94LmFuaW1hdGVcblx0XHRcdFx0XHRwcm9wZXJ0aWVzOlxuXHRcdFx0XHRcdFx0b3BhY2l0eTogMVxuXHRcdFx0XHRcdHRpbWU6IDIuMjVcblx0XHRcdFx0cXVlc3Rpb25Cb3guc3R5bGUgPVxuXHRcdFx0XHRcdFwiY29sb3JcIjpcImJsYWNrXCJcblx0XHRcdFx0XHRcInRleHQtYWxpZ25cIjpcImNlbnRlclwiXG5cdFx0XHRcdFx0XCJmb250LXNpemVcIjpcIjEyMCVcIlxuXHRcdFx0XHRcdFwicGFkZGluZy10b3BcIjpcIjI1cHhcIlxuXHRcdFx0XHRxdWVzdGlvbkJveC5jZW50ZXJYKClcblx0XHRcdFx0XG5cdFx0XHRcdCMgQ3JlYXRlIHRoZSBBbnN3ZXIgQm94ZXNcblx0XHRcdFx0aiA9IDBcblx0XHRcdFx0Zm9yIHJlc3BvbnNlIGluIHF1ZXN0aW9uLnJlc3BvbnNlc1xuXHRcdFx0XHRcdHJlc3BvbnNlQm94ID0gbmV3IExheWVyXG5cdFx0XHRcdFx0XHRzdXBlckxheWVyOiBzdGFnZVR3b1xuXHRcdFx0XHRcdFx0bmFtZTogXCJSZXNwb25zZV9cIiArIGpcblx0XHRcdFx0XHRcdGJhY2tncm91bmRDb2xvcjogXCJkYXJrZ3JheVwiXG5cdFx0XHRcdFx0XHRib3JkZXJSYWRpdXM6IDIwXG5cdFx0XHRcdFx0XHRvcGFjaXR5OiAwXG5cdFx0XHRcdFx0XHR5OiA0NTBcblx0XHRcdFx0XHRcdHg6IGogKiAyNTAgKyAyNTBcblx0XHRcdFx0XHRcdHdpZHRoOiAyMDBcblx0XHRcdFx0XHRcdGhlaWdodDogODBcblx0XHRcdFx0XHRcdGh0bWw6IHJlc3BvbnNlLnRleHRcblx0XHRcdFx0XHRyZXNwb25zZUJveC5zdHlsZSA9IFxuXHRcdFx0XHRcdFx0XCJjb2xvclwiOlwiYmxhY2tcIlxuXHRcdFx0XHRcdFx0XCJ0ZXh0LWFsaWduXCI6XCJjZW50ZXJcIlxuXHRcdFx0XHRcdFx0XCJmb250LXNpemVcIjpcIjEyMCVcIlxuXHRcdFx0XHRcdFx0XCJwYWRkaW5nLXRvcFwiOlwiMjVweFwiXG5cdFx0XHRcdFx0cmVzcG9uc2VCb3guYW5pbWF0ZVxuXHRcdFx0XHRcdFx0cHJvcGVydGllczpcblx0XHRcdFx0XHRcdFx0b3BhY2l0eTogMVxuXHRcdFx0XHRcdFx0dGltZTogMi4yNVxuXHRcdFx0XHRcdHJlc3BvbnNlQm94Lm9uIEV2ZW50cy5DbGljaywgYWRkQW5zd2VyXG5cdFx0XHRcdFx0aisrXG5cdFx0XHRcdGkrK1xuXHRcdGVycm9yOiAoZXJyKSAtPlxuXHRcdFx0cHJpbnQoXCJFcnJvcjogUXVlc3Rpb25zIGNvdWxkIG5vdCBiZSByZXRyaWV2ZWRcIilcblxuIyBHZXQgdGhlIGN1cnJlbnQgUmVzdWx0cyBvZiB0aGUgVXNlcjpcbmV4cG9ydHMuZ2V0UmVzdWx0cyA9IC0+XG5cdGdldFJlc3VsdHNCb3hQYXJhbXMgPSBcblx0XHR1cmk6IFwiL3YxL3VzZXJzL0RkT0JHNk11S2Ivc2Vzc2lvblwiXG5cdFx0dmVyYjogXCJHRVRcIlxuXHRcblx0UGFyc2UuQ2xvdWQucnVuICdzZXJ2ZScsIGdldFJlc3VsdHNCb3hQYXJhbXMsXG5cdFx0c3VjY2VzczogKHJlc3VsdCkgLT5cbiMgXHRcdFx0cHJpbnQgcmVzdWx0XG5cdFx0XHRpID0gMFxuXHRcdFx0Zm9yIGdhbWUgaW4gcmVzdWx0LmdhbWVzXG5cdFx0XHRcdGdhbWVSZXN1bHQgPSBuZXcgTGF5ZXJcblx0XHRcdFx0XHRzdXBlckxheWVyOiByZXN1bHRzTGlzdC5jb250ZW50XG5cdFx0XHRcdFx0aW1hZ2U6IGdhbWUuYm94X2FydF91cmxcblx0XHRcdFx0XHRuYW1lOiBcIkdhbWVfXCIgKyBnYW1lLm5hbWVcblx0XHRcdFx0XHRvcGFjaXR5OiAwXG5cdFx0XHRcdFx0d2lkdGg6IDYwMFxuXHRcdFx0XHRcdGhlaWdodDogMjAwXG5cdFx0XHRcdFx0eDogaSAqIDY1MFxuXHRcdFx0XHRcdHk6IDI1MFxuXHRcdFx0XHRcdGh0bWw6IGdhbWUubmFtZVxuXHRcdFx0XHRnYW1lUmVzdWx0LnN0eWxlID1cblx0XHRcdFx0XHRcInRleHQtYWxpZ25cIjpcImNlbnRlclwiXG5cdFx0XHRcdGdhbWVSZXN1bHQuYW5pbWF0ZVxuXHRcdFx0XHRcdHByb3BlcnRpZXM6XG5cdFx0XHRcdFx0XHRvcGFjaXR5OiAxXG5cdFx0XHRcdFx0dGltZTogMi4yNVxuXHRcdFx0XHRpKytcblx0XHRcdFx0Z2FtZVJlc3VsdC5vbiBFdmVudHMuQ2xpY2ssIC0+IHNob3dEZXRhaWxzQmx1cmIgdGhpc1xuXHRcdGVycm9yOiAoZXJyKSAtPlxuXHRcdFx0cHJpbnQoXCJFcnJvcjogY3VycmVudCBTZXNzaW9uIFJlc3VsdHMgY291bGQgbm90IGJlIHJldHJpZXZlZCFcIilcblxuIl19
