# - - - - - - - - - - - - INITIALIZATION - - - - - - - - - - - -

# Initialize a user (petracles) with a SteamApp session through 
# calling the Parse Steam App API
Parse.initialize("CmiqvYFtH6MgT0EuwBpgbbIEtrRdJcBM5VxpmXIm", "YVDd3DSJ7Ok8KGZZQyxPmeI1z33kNqIumocELM0A");

# - - - - - - - - - - - - - - LAYERS - - - - - - - - - - - - -

# BACKGROUND LAYER - - - - - - - - - -
bg = new Layer
	backgroundColor: "#626262"
	width: 1440
	height: 900

# STAGE SUPERLAYERS - - - - - - - - - -
stageIntro = new Layer
	backgroundColor: "transparent"
	x: -1440
	width: 1440
	height: 900
	opacity: 0
	
stageOne = new Layer
	backgroundColor: "transparent"
	x: -1440
	width: 1440
	height: 900
	opacity: 0
	
stageTwo = new Layer
	backgroundColor: "transparent"
	x: -1440
	width: 1440
	height: 900
	opacity: 0

stageThree = new Layer
	backgroundColor: "transparent"
	x: -1440
	width: 1440
	height: 900
	opacity: 0

# STAGE-INTRO STATIC LAYERS - - - - - - - - - -
welcomePrompt = new Layer
	superLayer: stageIntro
	backgroundColor: "#4A4A4A"
	width: 1500
	height: 175
	html: "Let's Find You Something to Play!"
welcomePrompt.centerX()
welcomePrompt.style =
	"color":"white"
	"font-size":"175%"
	"padding":"75px"
	"text-align":"center"

usernameFieldHtml = "<input style='color:gray; width:100%; padding:20px; font-size:35px; text-align:center' type='text' value='Enter Your Steam Account Name'>"

usernameField = new Layer
	superLayer: stageIntro
	backgroundColor: "lightgray"
	width: 700
	height: 90
	y: 300
	borderWidth: 2
	borderColor: 'black'
	borderRadius: 50
	html: usernameFieldHtml
	opacity: 0
usernameField.centerX()

steamLogo = new Layer
	superLayer: stageIntro
	width: 411
	height: 369
	y: 450
	scale: 0.8
	image: "images/SteamLogo.png"
steamLogo.centerX()

goLogo = new Layer
	superLayer: stageIntro
	opacity: 0
	width: 200
	height: 107
	y: 575
	image: "images/GO!.png"
goLogo.centerX()

# STAGE-ONE STATIC LAYERS - - - - - - - - - -
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
	y: 250
	width: 1000
	height: 50
	backgroundColor: "transparent"
	html: "Choose one or more criteria:"
promptOne.style =
	"text-align":"center"
	"font-size":"150%"

criteriaList = new ScrollComponent
	superLayer: stageOne
	backgroundColor: "transparent"
	x: 50
	y: 175
	width: 1340
	height: 700
criteriaList.scrollVertical = false

# STAGE-TWO STATIC LAYERS - - - - - - - - - -
progressBarTwo = new Layer
	superLayer: stageTwo
	width: 1440
	height: 175
	image: "images/ProgressBar_2.png"
progressBarOne.centerX()

promptTwo = new Layer
	superLayer: stageTwo
	x: 220
	y: 250
	width: 1000
	height: 50
	backgroundColor: 'transparent'
	html: "Answer the following:"
promptTwo.style =
	"text-align":"center"
	"font-size":"150%"

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
	
# STAGE-THREE STATIC LAYERS - - - - - - - - - -
progressBarThree = new Layer
	superLayer: stageThree
	width: 1440
	height: 175
	image: "images/ProgressBar_3.png"
progressBarThree.centerX()

promptThree = new Layer
	superLayer: stageThree
	x: 220
	y: 250
	width: 1000
	height: 50
	backgroundColor: 'transparent'
	html: "Choose your game!"
promptThree.style =
	"text-align":"center"
	"font-size":"125%"

backButton2 = new Layer
	superLayer: stageThree
	x: 50
	y: 40
	width: 250
	height: 80
	image: "images/BackButton.png"

resultsList = new ScrollComponent
	superLayer: stageThree
	backgroundColor: 'transparent'
	x: 50
	y: 175
	width: 1340
	height: 700
resultsList.scrollVertical = false

# - - - - - - - - - - - - STAGE STATES - - - - - - - - - - - -

# STAGE-INTRO STATES:
stageIntro.states.add
	Hidden:
		opacity: 0
		x: -1440
	Shown:
		opacity: 1
		x: 0
stageIntro.states.animationOptions =
	time: 1.5

# STAGE-ONE STATES:
stageOne.states.add
	Hidden:
		opacity: 0
		x: -1440
	Shown:
		opacity: 1
		x: 0
stageIntro.states.animationOptions =
	time: 1.5

# STAGE-TWO STATES:
stageTwo.states.add
	Hidden:
		opacity: 0
		x: -1440
	Shown:
		opacity: 1
		x: 0
stageIntro.states.animationOptions =
	time: 1.5

# STAGE-THREE STATES:
stageThree.states.add
	Hidden:
		opacity: 0
		x: -1440
	Shown:
		opacity: 1
		x: 0
stageIntro.states.animationOptions =
	time: 1.5

# - - - - - - - - - PROJECT FUNCTIONS - - - - - - - - -

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
	print: "Returning to the Criteria Selection"
	stageTwo.states.switch("Hidden")
	showStageOne()
backButton1.on Events.Click, backButtonOne

backButtonTwo = ->
	print: "Returning to the Criteria Selection"
	stageThree.states.switch("Hidden")
	showStageTwo()
backButton2.on Events.Click, backButtonTwo

addCriteria = ->
	print "Added this criteria to the session: " + this.name
	# do session stuff here
	nextButton1.animate
		properties:
			opacity: 1
		time: 0.8
	nextButton1.visible = true
	# Move up selected criteria and add to Session:
	# addToSession(this)
	this.animate if this.y>170
		properties:
			y: 100
	# Move down selected criteria and remove from Session:
	#removeFromSession(this)
	else this.animate
		properties:
			y: 175

addAnswer = ->
	print "Added a question response to the session for this question: " + this.html
	
	# do session stuff here
	
	this.animate if this.y is 450
		properties:
			y: 475
		time: 0.8
	else this.animate
		properties:
			y: 450
	
	nextButton2.animate
		properties:
			opacity: 1
		time: 0.8
	nextButton2.visible = true

showDetailsBlurb = (game) ->
	# Dim and disable everything behind details blurb:
	stageThree.opacity = 0.25
	backButton2.ignoreEvents = true
	
	# Bring up details blurb for selected game:
	print "Showing deatils for " + game.name
	detailsBlurb = new Layer
		width: 1180
		height: 600
		backgroundColor: 'gray'
		opacity: 0
		html: game.name
	detailsBlurb.animate
		properties:
			opacity: 1
		time: 0.9
	detailsBlurb.style = 
		"text-align":"center"
		"font-size":"210%"
		"padding-top":"25px"
	detailsBlurb.center()
	detailsBlurb.bringToFront()

	xBtn = new Layer
		superLayer: detailsBlurb
		image: "images/xBtn.png"
	xBtn.on Events.Click, ->
		detailsBlurb.destroy()
		stageThree.opacity = 1
		backButton2.ignoreEvents = false
		
	gameImage = new Layer
		superLayer: detailsBlurb
		image: game.image
		y: 200
		width: 600
		height: 200
	gameImage.centerX()
	
	playButton = new Layer
		superLayer: detailsBlurb
		backgroundColor: "darkgray"
		y: 450
		width: 350
		height: 125
		html: "PLAY!"
	playButton.centerX()
	playButton.style = 
		"text-align":"center"
		"font-size":"210%"
		"padding-top":"50px"
	playButton.on Events.Click, -> startLaunchingSteamScreen()

startLaunchingSteamScreen = ->
	print "LAUNCHING STEAM!"

# - - - - - - - - - - PARSE FUNCTIONS - - - - - - - - - -
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
			print("Error")

getQuestions = ->
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

getResults = ->
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

# - - - - - - - - - - STAGE FUNCTIONS - - - - - - - - - -

# INTRO STAGE:
startStageIntro = ->
	stageIntro.states.switch("Shown")
	
	usernameField.animate
		properties:
	 		opacity: 1
		time: 2.5

# STAGE ONE:
startStageOne = ->
	# Update stages
	stageIntro.states.switch("Hidden")
	stageOne.states.switch("Shown")
	
	# HANDLE USERNAME FIELD HERE!
	
	# Get all of the Criteria
	getCriteria()
	# Delete Stage Intro for mem
	stageIntro.destroy()

showStageOne = ->
	stageOne.states.switch("Shown")
	stageTwo.states.switch("Hidden")
	stageThree.states.switch("Hidden")

# STAGE TWO: - - - - - - - - - -

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

# STAGE THREE: - - - - - - - - - - -
startStageThree = ->
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