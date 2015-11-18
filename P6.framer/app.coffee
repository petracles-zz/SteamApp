# - - - - - - - - - - - - INITIALIZATION - - - - - - - - - - - -

# Initialize a user (petracles) with a SteamApp session through 
# calling the Parse Steam App API
Parse.initialize("CmiqvYFtH6MgT0EuwBpgbbIEtrRdJcBM5VxpmXIm", "YVDd3DSJ7Ok8KGZZQyxPmeI1z33kNqIumocELM0A");

# - - - - - - - - - - - - - - LAYERS - - - - - - - - - - - - -

# BACKGROUND LAYER:
bg = new Layer
	backgroundColor: "#626262"
	width: 1440
	height: 900

# STAGE SUPERLAYERS:
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

# STAGE INTRO LAYERS:
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

# STAGE ONE LAYERS:
progressBarOne = new Layer
	superLayer: stageOne
	backgroundColor: "Black"
	y: -200
	width: 1440
	height: 175
	html: "<span style='text-align:center'>TEXT PROMPT HERE</span>"
progressBarOne.centerX()

prompt = new Layer
	superLayer: stageOne
	x: 220
	y: 250
	width: 1000
	height: 50
	backgroundColor: 'transparent'
	html: "hey I'm another prompt right here!"

# - - - - - - - - - - - - STAGE STATES - - - - - - - - - - - -

stageIntro.states.add
	Hidden:
		opacity: 0
		x: -1440
	Shown:
		opacity: 1
		x: 0
stageIntro.states.animationOptions =
	time: 1.5

stageOne.states.add
	Hidden:
		opacity: 0
		x: -1440
	Shown:
		opacity: 1
		x: 0
stageIntro.states.animationOptions =
	time: 1.5

stageTwo.states.add
	Hidden:
		opacity: 0
		x: -1440
	Shown:
		opacity: 1
		x: 0
stageIntro.states.animationOptions =
	time: 1.5
	
stageThree.states.add
	Hidden:
		opacity: 0
		x: -1440
	Shown:
		opacity: 1
		x: 0
stageIntro.states.animationOptions =
	time: 1.5

# - - - - - - - - - - - - LAYER STATES - - - - - - - - - - - -

# STAGE INTRO:
# steamLogo.states.add
# 	Hidden:
# 		opacity: 0
# 		visible: false
# 	Shown:
# 		opacity: 1
# 		visible: true
# 
# STAGE ONE:
# goLogo.states.add
# 	Hidden:
# 		opacity: 0
# 		visible: false
# 	Shown:
# 		opacity: 0
# 		visible: true
# 
# prompt.states.add
# 	Hidden:
# 		opacity: 0
# 		visible: false
# 	Shown:
# 		opacity: 1
# 		visible: true
# 
# STAGE AGNOSTIC
# progressBar.states.add
# 	Hidden:
# 		y: -200
# 		opacity: 0
# 	Shown:
# 		y: 0
# 		opacity: 1

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

# - - - - - - - - - - STAGE FUNCTIONS - - - - - - - - - -

# INTRO STAGE:
startStageIntro = ->
	stageIntro.states.switch("Shown")
	
# 	steamLogo.states.switch("Shown")
# 	goLogo.states.switch("Shown")
# 	progressBar.states.switch("Hidden")
# 	prompt.states.switch("Hidden")

# STAGE ONE:
startStageOne = ->
	stageIntro.states.switch("Hidden")
	stageOne.states.switch("Shown")

# 	steamLogo.states.switch("Hidden")
# 	goLogo.states.switch("Hidden")
# 	progressBar.states.switch("Shown", time: 1.5, curve: "ease")
# 	prompt.states.switch("Shown", time: 1.5, curve: "ease")

	# Loop and add create the Criteria Questions
	criteriaList = new ScrollComponent
		backgroundColor: 'transparent'
		y: -1000
		width: 1240
		height: 900
	criteriaList.scrollVertical = false
	
	params = 
		uri: "/v1/criteria"
		verb: "GET"
	
	Parse.Cloud.run 'serve', params,
		success: (results) ->
			i = 0
			for result in results
				criteria = new Layer
					superLayer: criteriaList.content
					name: "Criteria " + result.name
					html: result.name
					width: 300
					height: 300
					x: i * 350
					y: 225
					opacity: 1
				print(result.name)
				i++
			criteriaList.x = 100
			criteriaList.y = 175
		error: (err) ->
			print("Error: #{err}")

# STAGE TWO: - - - - - - - - - -


# STAGE THREE: - - - - - - - - - - -


# - - - - - - - - - - THE PROGRAM MAIN - - - - - - - - - -

# Start the application:
startStageIntro()

# Start State One if GO is clicked:
steamLogo.on Events.Click, -> startStageOne()

# stageOne.x = 0