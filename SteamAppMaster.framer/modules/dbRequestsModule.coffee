###

This Module is designed to hold all functions that interact with our
Parse.js back-end. This includes the User, Session, Criteria,
Questions, and Games requests (note some have GET as well as POST
functionality!).

###

criteriaList = new ScrollComponent
	superLayer: stageOne
	backgroundColor: "transparent"
	x: 50
	y: 175
	width: 1340
	height: 700
criteriaList.scrollVertical = false

# Make a SteamApp User
exports.postUser = ->
	# Make the parameters for the request, then make the request
	postUserParams = 
		'uri' : '/v1/users/12345'
		'verb' : 'POST'
		'body' :
			'steam_account_name' : 'Petraclezzz'
	
	Parse.Cloud.run 'serve', postUserParams,
		success: (results) ->
			print "FUCK YA"
			print results
		error: (err) ->
			print(err)

# Get a SteamApp User
exports.getUser = ->
	# Make the parameters for the request, then make the request
	getUserParams = 
		'uri': '/v1/users/DdOBG6MuKb'
		'verb': 'GET'
	
	Parse.Cloud.run 'serve', getUserParams,
		success: (results) ->
			print results
		error: (err) ->
			print(err)

# Retrieve all Criteria for the User to select from:
exports.getCriteria = ->
	# Make the parameters for the request, then make the request
	getCriteriaParams = 
		uri: "/v1/criteria"
		verb: "GET"
	
	Parse.Cloud.run 'serve', getCriteriaParams,
		success: (results) ->
			i = 0
			# Loop and add create the Criteria Questions objects
			for result in results
				criteria = new Layer
					superLayer: criteriaList.content
					image: result.icon_url
					name: "Criteria_" + result.name
					opacity: 0
					width: 650
					height: 550
					x: i * 650
					y: 175
				criteria.animate
					properties:
						opacity: 1
					time: 2.25
				i++
				criteria.on Events.Click, addCriteria
		error: (err) ->
			print("Could not GET Criteria!")

# Retrieve all Questions for the User based on previously selected Criteria:
exports.getQuestions = ->
	# Make the parameters for the request, then make the request
	getQuestionsParams = 
		uri: "/v1/questions"
		verb: "GET"
	
	Parse.Cloud.run 'serve', getQuestionsParams,
		success: (result) ->
			result = result[0]
			# Create the Question Boxes
			i = 0
			for question in result.questions
				questionBox = new Layer
					superLayer: stageTwo
					name: "Question_" + i
					opacity: 1
					backgroundColor: "lightgray"
					borderRadius: 20
					y: i * 150 + 350
					width: 1000
					height: 80
					html: question.text
				questionBox.animate
					properties:
						opacity: 1
					time: 2.25
				questionBox.style =
					"color":"black"
					"text-align":"center"
					"font-size":"120%"
					"padding-top":"25px"
				questionBox.centerX()
				
				# Create the Answer Boxes
				j = 0
				for response in question.responses
					responseBox = new Layer
						superLayer: stageTwo
						name: "Response_" + j
						backgroundColor: "darkgray"
						borderRadius: 20
						opacity: 0
						y: 450
						x: j * 250 + 250
						width: 200
						height: 80
						html: response.text
					responseBox.style = 
						"color":"black"
						"text-align":"center"
						"font-size":"120%"
						"padding-top":"25px"
					responseBox.animate
						properties:
							opacity: 1
						time: 2.25
					responseBox.on Events.Click, addAnswer
					j++
				i++
		error: (err) ->
			print("Error: Questions could not be retrieved")

# Get the current Results of the User:
exports.getResults = ->
	getResultsBoxParams = 
		uri: "/v1/users/DdOBG6MuKb/session"
		verb: "GET"
	
	Parse.Cloud.run 'serve', getResultsBoxParams,
		success: (result) ->
# 			print result
			i = 0
			for game in result.games
				gameResult = new Layer
					superLayer: resultsList.content
					image: game.box_art_url
					name: "Game_" + game.name
					opacity: 0
					width: 600
					height: 200
					x: i * 650
					y: 250
					html: game.name
				gameResult.style =
					"text-align":"center"
				gameResult.animate
					properties:
						opacity: 1
					time: 2.25
				i++
				gameResult.on Events.Click, -> showDetailsBlurb this
		error: (err) ->
			print("Error: current Session Results could not be retrieved!")

