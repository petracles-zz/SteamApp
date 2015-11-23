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
steamLogo = new Layer
	superLayer: stageIntro
	width: 411
	height: 369
	image: "images/SteamLogo.png"
steamLogo.center()

goLogo = new Layer
	superLayer: stageIntro
	opacity: 0
	width: 200
	height: 107
	image: "images/GO!.png"
goLogo.center()

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
	x: 220
	y: 250
	width: 1000
	height: 50
	backgroundColor: 'transparent'
	html: "Choose one or more criteria:"
promptOne.style =
	"text-align":"center"
	"font-size":"125%"

criteriaList = new ScrollComponent
	superLayer: stageOne
	backgroundColor: 'transparent'
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
	"font-size":"125%"

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

# - - - - - - - - - ANIMATION FUNCTIONS - - - - - - - - -

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
	startStageOne()
backButton1.on Events.Click, backButtonOne

backButtonTwo = ->
	print: "Returning to the Criteria Selection"
	stageThree.states.switch("Hidden")
	startStageOne()
backButton2.on Events.Click, backButtonTwo

showNextOne = ->
	print "Added a criteria to the session"
	nextButton1.animate
		properties:
			opacity: 1
		time: 0.8
	nextButton1.visible = true

showNextTwo = ->
	print "Added a question response to the session"
	nextButton2.animate
		properties:
			opacity: 1
		time: 0.8
	nextButton2.visible = true

showDetailsBlurb = (game) ->
	print "Showing deatils for " + game
	detailsBlurb = new Layer
		width: 1180
		height: 600
		backgroundColor: 'gray'
		opacity: 0
		html: "Play: " + game
	detailsBlurb.animate
		properties:
			opacity: 1
		time: 0.9
	detailsBlurb.style = 
		"text-align":"center"
		"font-size":"210%"
	detailsBlurb.center()
	detailsBlurb.bringToFront()

	xBtn = new Layer
		superLayer: detailsBlurb
		image: "images/xBtn.png"
	xBtn.on Events.Click, -> detailsBlurb.destroy()

# - - - - - - - - - - STAGE FUNCTIONS - - - - - - - - - -

# INTRO STAGE:
startStageIntro = ->
	stageIntro.states.switch("Shown")

# STAGE ONE:
startStageOne = ->
	# Update stages
	stageIntro.states.switch("Hidden")
	stageOne.states.switch("Shown")
	
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
				criteria.on Events.Click, showNextOne
		error: (err) ->
			print("Error")
	
	# Delete Stage Intro for mem
	stageIntro.destroy()

# STAGE TWO: - - - - - - - - - -

# Update stages
startStageTwo = ->
	stageOne.states.switch("Hidden")
	stageTwo.states.switch("Shown")
	
	# Make the parameters for the request, then make the request
	getQuestionsParams = 
		uri: "/v1/questions"
		verb: "GET"
	
	Parse.Cloud.run 'serve', getQuestionsParams,
		success: (result) ->
			result = result[0]
			i = 0
			for question in result.questions
				questionBox = new Layer
					superLayer: stageTwo
					name: "Question_" + i
					opacity: 0
					y: i * 150 + 350
					width: 1000
					height: 80
					image: "images/questionBox.png"
					html: question.text
				questionBox.animate
					properties:
						opacity: 1
					time: 2.25
				questionBox.style =
					"color":"black"
					"text-align":"center"
				questionBox.centerX()
				questionBox.on Events.Click, showNextTwo
				i++
		error: (err) ->
			print("Error")

# STAGE THREE: - - - - - - - - - - -
startStageThree = ->
	stageOne.states.switch("Hidden")
	stageTwo.states.switch("Hidden")
	stageThree.states.switch("Shown")
	
	getResultsBoxParams = 
		uri: "/v1/users/123/session"
		verb: "GET"
	
	Parse.Cloud.run 'serve', getResultsBoxParams,
		success: (result) ->
			i = 0
			for game in result.games
				gameResult = new Layer
					superLayer: resultsList.content
# 					image: result.icon_url
					name: "Game_" + game.name
					opacity: 0
					width: 350
					height: 550
					x: i * 550
					y: 175
					html: game.name
				gameResult.style =
					"text-align":"center"
				gameResult.animate
					properties:
						opacity: 1
					time: 2.25
				i++
				gameResult.on Events.Click, -> showDetailsBlurb this.name
		error: (err) ->
			print("Error")

# - - - - - - - - - - THE PROGRAM MAIN - - - - - - - - - -

# Start the application:
startStageIntro()

# Start State One if GO is clicked:
steamLogo.on Events.Click, -> startStageOne()

nextButton1.on Events.Click, -> startStageTwo()

nextButton2.on Events.Click, -> startStageThree()

# playButton.on Events.Click, -> startLaunchingSteamScreen()