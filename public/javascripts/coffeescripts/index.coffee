log = console.log.bind(console)


#############################################
#  CANVAS MANAGER
#############################################
window.CanvasManager =
	mutex: false
	ctx: null
	canvas: null
	height: 0
	width: 0
	inside: false
	initCanvas: (id)->
		new window.CanvasBrushView(
			el:$("##{id}")
			id: id
		)
	init: ()->
		@initCanvas("bg_header")
		@initCanvas("bg_section_1")

$(document).ready(->
	window.CanvasManager.init()
)
