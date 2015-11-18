# INITIALIZATION - - - - - - - - - -

# Initialize a user (petracles) with a SteamApp session through 
# calling the Parse Steam App API
Parse.initialize("CmiqvYFtH6MgT0EuwBpgbbIEtrRdJcBM5VxpmXIm", "YVDd3DSJ7Ok8KGZZQyxPmeI1z33kNqIumocELM0A");

# LAYERS - - - - - - - - - -

# The background Layer:
bg = new Layer
	backgroundColor: "#626262"
	width: 1440
	height: 900		

# Introduction Layers:
steamLogo = new Layer
	x: -1000
	y: -1000
	width: 411
	height: 369
	image: "images/SteamLogo.png"
steamLogo.center()

goLogo = new Layer
	opacity: 0
	width: 200
	height: 107
	image: "images/GO!.png"
goLogo.center()

# Stage One Layers:
progressBar = new Layer
	backgroundColor: "Black"
	y: -200
	width: 1440
	height: 175
	html: "<span style='text-align:center'>TEXT PROMPT HERE</span>"
progressBar.centerX()

# STATES - - - - - - - - - -
steamLogo.states.add
	StageIntro:
		opacity: 1
		visible: true
	StageOne:
		opacity: 0
		visible: false
	StageTwo:
		opacity: 0
		visible: false
	StageThree:
		opacity: 0
		visible: false
steamLogo.states.animationOptions =
	time: 0.5

goLogo.states.add
	StageIntro:
		opacity: 0
		visible: true
	StageOne:
		opacity: 0
		visible: false
	StageTwo:
		opacity: 0
		visible: false
	StageThree:
		opacity: 0
		visible: false
goLogo.states.animationOptions =
	time: 0.5

progressBar.states.add
	Hidden:
		y: -200
		opacity: 1
	Shown:
		y: 0
		opacity: 1
progressBar.states.animationOptions =
	time: 2

# INTRODUCTION STAGE - - - - - - - - - -
startStageIntro = ->
	steamLogo.states.switch("StageIntro")
	goLogo.states.switch("StageIntro")
	progressBar.states.switch("Hidden")

animateStartButtonMouseOver = ->
	steamLogo.animate
		properties:
			opacity: 0
		time: 0.4
	goLogo.animate
		properties:
			opacity: 1
		time: 0.4

animateStartButtonMouseOff = ->
	steamLogo.animate
		properties:
			opacity: 1
		time: 0.4
	goLogo.animate
		properties:
			opacity: 0
		time: 0.4

# STAGE ONE: - - - - - - - - - -
startStageOne = ->
	steamLogo.states.switch("StageOne")
	goLogo.states.switch("StageOne")
	progressBar.states.switch("Shown", time: 1.5, curve: "ease")
	
	prompt = new Layer
		backgroundColor: 'transparent'
		html: "hey I'm another prompt right here!"
	prompt.animate
		properties:
			x: 220
			y: 250
			width: 1000
			height: 50
		time: 0.5

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

steamLogo.on Events.MouseOver, animateStartButtonMouseOver
steamLogo.on Events.MouseOut, animateStartButtonMouseOff

# Start State One if GO is clicked:
steamLogo.on Events.Click, -> startStageOne()