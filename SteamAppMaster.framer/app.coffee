# - - - - - - - - - - - - INITIALIZATION - - - - - - - - - - - -



# Initialize the Parse SteamApp API:
Parse.initialize("CmiqvYFtH6MgT0EuwBpgbbIEtrRdJcBM5VxpmXIm", "YVDd3DSJ7Ok8KGZZQyxPmeI1z33kNqIumocELM0A");

# Modeuls:
# dbRequests = require "dbRequestsModule"



# - - - - - - - - - - - APPLICATION VARS - - - - - - - - - - - - -



# Array to hold all include_only CriteriaID(s) for Questions
includeOnlyQuestions = []

# Array to hold all exclude_tags for the Session
excludeTags = []

# Array to hold games rejected from the Results Box
excludeGames = []

# Session ID:
sessionID = ""
questionCleanup = []



# - - - - - - - - - - - APPLICATION LAYERS - - - - - - - - - - - - -



# Background Layer:
Bg = new Layer
	backgroundColor: "#3E3E3E"
	width: 1440
	height: 900

# StageIntro SuperLayer:
stageIntro = new Layer
	backgroundColor: "transparent"
	x: -1440
	width: 1440
	height: 900
	opacity: 0
stageIntro.states.add
	Hidden:
		opacity: 0
		x: -1440
	Shown:
		opacity: 1
		x: 0
stageIntro.states.animationOptions =
	time: 1.5
	
# StageOne SuperLayer:
stageOne = new Layer
	backgroundColor: "transparent"
	x: -1440
	width: 1440
	height: 900
	opacity: 0
stageOne.states.add
	Hidden:
		opacity: 0
		x: -1440
	Shown:
		opacity: 1
		x: 0
stageOne.states.animationOptions =
	time: 1.5

# StageTwo SuperLayer:
stageTwo = new Layer
	backgroundColor: "transparent"
	x: -1440
	width: 1440
	height: 900
	opacity: 0
stageTwo.states.add
	Hidden:
		opacity: 0
		x: -1440
	Shown:
		opacity: 1
		x: 0
stageTwo.states.animationOptions =
	time: 1.5

# StageThree SuperLayer:
stageThree = new Layer
	backgroundColor: "transparent"
	x: -1440
	width: 1440
	height: 900
	opacity: 0
stageThree.states.add
	Hidden:
		opacity: 0
		x: -1440
	Shown:
		opacity: 1
		x: 0
stageThree.states.animationOptions =
	time: 1.5



# - - - - - - - - - - - - STAGE LAYERS - - - - - - - - - - - - -



# StageIntro Layers:
welcomePrompt = new Layer
	superLayer: stageIntro
	backgroundColor: "#4A4A4A"
	width: 1440
	height: 175
	html: "Let's Find You Something to Play!"
welcomePrompt.centerX()
welcomePrompt.style =
	"color":"white"
	"font-size":"175%"
	"padding":"75px"
	"text-align":"center"

directionsPrompt = new Layer
	superLayer: stageIntro
	width: 1440
	height: 250
	y: 200
	image: "images/directionsPrompt.png"

steamLogo = new Layer
	superLayer: stageIntro
	width: 411
	height: 369
	y: 475
	scale: 0.8
	image: "images/SteamLogo.png"
steamLogo.centerX()

goLogo = new Layer
	superLayer: stageIntro
	opacity: 0
	width: 200
	height: 107
	y: 600
	image: "images/GO!.png"
goLogo.centerX()

# StageOne Layers:
progressBarOne = new Layer
	superLayer: stageOne
	width: 1440
	height: 175
	image: "images/ProgressBar_1.png"
progressBarOne.centerX()

nextButton1 = new Layer
	superLayer: stageOne
	x: 1150
	y: 40
	width: 250
	height: 80
	opacity: 0
	visible: false
	image: "images/NextButton.png"

promptOne = new Layer
	superLayer: stageOne
	backgroundColor: "transparent"
	x: 220
	y: 215
	width: 1000
	height: 50
	backgroundColor: "transparent"
	html: "Drag and select ONE Criteria to begin"
promptOne.style =
	"text-align":"center"
	"font-size":"150%"
	"padding":"10px"

criteriaList = new ScrollComponent
	superLayer: stageOne
	backgroundColor: "transparent"
	x: 50
	y: 175
	width: 1340
	height: 700
criteriaList.scrollVertical = false
criteriaList.speedX = 0.5

# StageTwo Layers:
progressBarTwo = new Layer
	superLayer: stageTwo
	width: 1440
	height: 175
	image: "images/ProgressBar_2.png"
progressBarOne.centerX()

promptTwo = new Layer
	superLayer: stageTwo
	x: 220
	y: 215
	width: 1000
	height: 50
	backgroundColor: 'transparent'
	html: "Answer the following and click Next"
promptTwo.style =
	"text-align":"center"
	"font-size":"150%"
	"padding":"10px"

backButton1 = new Layer
	superLayer: stageTwo
	x: 50
	y: 40
	width: 250
	height: 80
	image: "images/BackButton.png"

nextButton2 = new Layer
	superLayer: stageTwo
	x: 1150
	y: 40
	width: 250
	height: 80
	opacity: 0
	visible: false
	image: "images/NextButton.png"
	
# StageThree Layers:
progressBarThree = new Layer
	superLayer: stageThree
	width: 1440
	height: 175
	image: "images/ProgressBar_3.png"
progressBarThree.centerX()

promptThree = new Layer
	superLayer: stageThree
	x: 220
	y: 215
	width: 1000
	height: 50
	backgroundColor: 'transparent'
	html: "Choose your game!"
promptThree.style =
	"text-align":"center"
	"font-size":"150%"
	"padding":"10px"

backButton2 = new Layer
	superLayer: stageThree
	x: 50
	y: 40
	width: 250
	height: 80
	image: "images/BackButton.png"

againButton = new Layer
	superLayer: stageThree
	x: 1140
	y: 40
	width: 250
	height: 80
	image: "images/againButton.png"
	
resultsList = new ScrollComponent
	superLayer: stageThree
	backgroundColor: 'transparent'
	x: 50
	y: 175
	width: 1340
	height: 700
resultsList.scrollVertical = false



# - - - - - - - - - - - APPLICATION FUNCITONS - - - - - - - - - - - - -



animateStartButtonMouseOver = ->
	steamLogo.animate
		properties:
			opacity: 0
		time: 0.4
	goLogo.animate
		properties:
			opacity: 1
		time: 0.4
steamLogo.on Events.MouseOver, animateStartButtonMouseOver

animateStartButtonMouseOff = ->
	steamLogo.animate
		properties:
			opacity: 1
		time: 0.4
	goLogo.animate
		properties:
			opacity: 0
		time: 0.4
steamLogo.on Events.MouseOut, animateStartButtonMouseOff

backButtonOne = ->
	console.log "Returning to the Stage One"
	stageTwo.states.switch("Hidden")
	showStageOne()
backButton1.on Events.Click, backButtonOne

backButtonTwo = ->
	console.log "Returning to the Stage Two"
	stageThree.states.switch("Hidden")
	showStageTwo()
backButton2.on Events.Click, backButtonTwo

doItAgain = ->
	console.log "Returning to Stage One"
	stageThree.states.switch("Hidden")
	showStageOne()
againButton.on Events.Click, doItAgain

# Add the selected Criteria to the Session:
addCriteriaToSession = (crit) ->
	includeOnlyQuestions.push(crit.name)

removeCriteriaFromSession = (crit) ->
	indexOfCritID = includeOnlyQuestions.indexOf(crit.name)
	includeOnlyQuestions.splice(indexOfCritID, 1)

addCriteria = ->
	# Debug:
	console.log this.name + " (criteria) was clicked"
	
	# Move up selected criteria and add to Session:
	if this.y > 170
		addCriteriaToSession(this)
		this.animate if this.y > 170
			properties:
				y: 100
	# Move down selected criteria and remove from Session:
	else
		removeCriteriaFromSession(this)
		this.animate
			properties:
				y: 175
	
	# If no Criteria is selected, remove NEXT button, otherwise show it:
	if includeOnlyQuestions.length > 0
		nextButton1.animate
			properties:
				opacity: 1
			time: 0.8
		nextButton1.visible = true
	else
		nextButton1.animate
			properties:
				opacity: 0
			time: 0.8
		nextButton1.visible = false

showDetailsBlurb = (game) ->
	# Dim and disable everything behind details blurb:
	stageThree.opacity = 0.25
	backButton2.ignoreEvents = true
	againButton.ignoreEvents = true
	
	# Bring up details blurb for selected game:
	console.log "Showing deatils for " + game.name
	detailsBlurb = new Layer
		backgroundColor: 'gray'
		width: 1080
		height: 400
		borderColor: "black"
		borderWidth: 5
		borderRadius: 20
		opacity: 0
	detailsBlurb.animate
		properties:
			opacity: 1
		time: 0.9
	detailsBlurb.center()
	detailsBlurb.bringToFront()
	
	gameImage = new Layer
		superLayer: detailsBlurb
		borderRadius: 20
		image: game.image
		y: 50
		width: 600
		height: 200
	gameImage.centerX()
	
	removeGameButton = new Layer
		superLayer: detailsBlurb
		backgroundColor: "darkgray"
		borderColor: "black"
		borderWidth: 3
		borderRadius: 15
		width: 180
		height: 80
		x: 860
		y: 30
		html: "REMOVE"
	removeGameButton.style = 
		"text-align":"center"
		"font-size":"120%"
		"padding-top":"20px"
	removeGameButton.on Events.Click, ->
		detailsBlurb.destroy()
		stageThree.opacity = 1
		excludeGames.push(game.name)
		console.log "Game Removed!"
		game.animate
			properties:
				opacity: 0.2
		game.ignoreEvents = true
		backButton2.ignoreEvents = false
		againButton.ignoreEvents = false

	xBtn = new Layer
		superLayer: detailsBlurb
		x: 30
		y: 20
		image: "images/xBtn.png"
	xBtn.on Events.Click, ->
		detailsBlurb.destroy()
		stageThree.opacity = 1
		backButton2.ignoreEvents = false
		againButton.ignoreEvents = false
	
	playButton = new Layer
		superLayer: detailsBlurb
		backgroundColor: "darkgray"
		borderColor: "black"
		borderWidth: 3
		borderRadius: 15
		y: 275
		width: 325
		height: 75
		html: "PLAY!"
	playButton.centerX()
	playButton.style = 
		"text-align":"center"
		"font-size":"150%"
		"padding-top":"20px"
	playButton.on Events.Click, -> print "LAUNCHING STEAM!"



# - - - - - - - - - - - APPLICATION FUNCITONS - - - - - - - - - - - - -


# - - - - - USER: - - - - - 

# Make a SteamApp User
# postUser = ->
# 	Make the parameters for the request, then make the request
# 	postUserParams = 
# 		'uri' : '/v1/users/12345'
# 		'verb' : 'POST'
# 		'body' :
# 			'steam_account_name' : 'Petraclezzz'
# 	
# 	Parse.Cloud.run 'serve', postUserParams,
# 		success: (results) ->
# 			console.log results
# 		error: (err) ->
# 			ccnsole.log(err)
# 
# Get a SteamApp User
# getUser = ->
# 	Make the parameters for the request, then make the request
# 	getUserParams = 
# 		'uri': '/v1/users/DdOBG6MuKb'
# 		'verb': 'GET'
# 	
# 	Parse.Cloud.run 'serve', getUserParams,
# 		success: (results) ->
# 			console.log results
# 		error: (err) ->
# 			console.log(err)

# - - - - - SESSION: - - - - - 

# Comment:
getSession = ->
	# Make the parameters for the request, then make the request
	getSessionParams = 
		'uri': '/v1/users/DdOBG6MuKb/sessions/YDjPp8XZSG'
		'verb': 'GET'
	
	Parse.Cloud.run 'serve', getSessionParams,
		success: (results) ->
			console.log results
		error: (err) ->
			console.log(err)

# Comment:
postSession = ->
	# Make the parameters for the request, then make the request
	postSessionParams = 
		'uri': '/v1/users/DdOBG6MuKb/session/'
		'verb': 'POST'
	
	Parse.Cloud.run 'serve', postSessionParams,
		success: (results) ->
			sessionID = results.id
		error: (err) ->
			console.log(err)

# Update the User's current Session
putSession = ->
	# Make the parameters for the request, then make the request
	postSessionParams = 
		uri: '/v1/users/DdOBG6MuKb/sessions/' + sessionID
		verb: 'PUT'
		body: {
			'exclude_games': excludeGames,
			'exclude_tags' : excludeTags
		}
	
	Parse.Cloud.run 'serve', postSessionParams,
		success: (results) ->
			console.log "SESSION UPDATED"
		error: (err) ->
			console.log "SESSION UPDATE FAILED: " + err

# Retrieve all Criteria for the User to select from:
getCriteria = ->
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
					name: result.id
					opacity: 0
					width: 650
					height: 550
					x: i * 800
					y: 175
					scale: 0.75
				criteria.animate
					properties:
						opacity: 1
					time: 2.25
				i++
				criteria.on Events.Click, addCriteria
		error: (err) ->
			console.log("Could not GET Criteria!")

# Retrieve all Questions for the User based on previously selected Criteria:
getQuestions = ->
	# Cleanup old questions
	for layer in questionCleanup
		layer.destroy()
	
	# Make the parameters for the request, then make the request
	getQuestionsParams = 
		uri: "/v1/questions"
		verb: "GET"
		urlParams: {"include_only":includeOnlyQuestions}
	
	Parse.Cloud.run 'serve', getQuestionsParams,
		success: (result) ->
			# Find the Questions tied to the selected Critera
			result = result[0]
			
			# Create *ONE* of Question Boxes
			i = 0
			question = result.questions[0]
			questionBox = new Layer
				superLayer: stageTwo
				name: question.tag.id
				opacity: 1
				backgroundColor: "lightgray"
				borderRadius: 20
				y: i * 250 + 350
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
			questionCleanup.push(questionBox)
			
			# Create the Answer Boxes
			j = 0
			for response in question.responses
				responseBox = new Layer
					superLayer: stageTwo
					name: response.valence
					backgroundColor: "darkgray"
					borderRadius: 20
					opacity: 0
					y: questionBox.y + 100
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
				questionCleanup.push(responseBox)
				responseBox.on Events.Click, ->
					if this.name > 0
						# Do not add, they don't want to exclude the tag
						console.log "DO NOT ADD THE TAG"
						if this.y is questionBox.y + 100
							this.animate
								properties:
									this.y = this.y + 50
								time: 0.7
						else
							this.animate
								properties:
									this.y = this.y - 50
								time: 0.7
					else
						indexOfTagID = excludeTags.indexOf(question.tag.id)
						if indexOfTagID is -1
							console.log "Adding Exclude_Tag: " + question.tag.id
							excludeTags.push(question.tag.id)
							this.animate
								properties:
									this.y = this.y + 50
								time: 0.7
						else
							console.log "Removing Exclude_Tag: " + question.tag.id
							excludeTags.splice(indexOfTagID, 1)
							this.animate
								properties:
									this.y = this.y - 50
								time: 0.7
					nextButton2.animate
						properties:
							opacity: 1
						time: 0.8
					nextButton2.visible = true
				j++
			i++
		error: (err) ->
			console.log("Error: Questions could not be retrieved")

# Get the current Results of the User:
getResults = ->
	# Clean up the old resultsList
	for layer in resultsList.content.subLayers
		layer.destroy()
	
	# Update the Session with the most recent Tags
	putSession()
	
	getResultsBoxParams = 
		uri: "/v1/users/DdOBG6MuKb/session"
		verb: "GET"
	
	Parse.Cloud.run 'serve', getResultsBoxParams,
		success: (result) ->
			i = 0
			for game in result.games[1..10]
				gameResult = new Layer
					superLayer: resultsList.content
					image: game.box_art_url
					name: game.id
					opacity: 0
					width: 600
					height: 200
					x: i * 650
					y: 250
					html: game.name
				gameResult.style =
					"text-align":"center"
					"padding":"20px"
					"font-size":"120%"
				gameResult.animate
					properties:
						opacity: 1
					time: 2.25
				i++
				gameResult.on Events.Click, -> showDetailsBlurb this
		error: (err) ->
			console.log ("Error: current Session Results could not be retrieved!")



# - - - - - - - - - - - MAIN FUNCITONS - - - - - - - - - - - - -



# StageIntro:
startStageIntro = ->
	stageIntro.states.switch("Shown")
	
	postSession()

# StageOne:
startStageOne = ->
	# Update stages
	stageIntro.states.switch("Hidden")
	stageOne.states.switch("Shown")
	
# 	HANDLE USERNAME FIELD HERE!
	
	# Get all of the Criteria
	getCriteria()
	# Delete Stage Intro for mem
	stageIntro.destroy()

showStageOne = ->
	stageOne.states.switch("Shown")
	stageTwo.states.switch("Hidden")
	stageThree.states.switch("Hidden")

# StageTwo:
startStageTwo = ->
	# Update stages
	stageOne.states.switch("Hidden")
	stageTwo.states.switch("Shown")
	
	# Get all of the Questions
	getQuestions()

showStageTwo = ->
	stageOne.states.switch("Hidden")
	stageTwo.states.switch("Shown")
	stageThree.states.switch("Hidden")

# StageThree
startStageThree = ->
	# Update Stages
	stageOne.states.switch("Hidden")
	stageTwo.states.switch("Hidden")
	stageThree.states.switch("Shown")
	
	# Get the Results from the current Session
	getResults()

showStageThree = ->
	stageOne.states.switch("Hidden")
	stageTwo.states.switch("Hidden")
	stageThree.states.switch("Shown")

# - - - - - - - - - - THE PROGRAM MAIN - - - - - - - - - -

# Start the application:
startStageIntro()

# Start State One if GO is clicked:
steamLogo.on Events.Click, -> startStageOne()

nextButton1.on Events.Click, -> startStageTwo()

nextButton2.on Events.Click, -> startStageThree()