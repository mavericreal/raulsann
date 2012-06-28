log = console.log.bind(console)

#############################################
#  PROFILE
#############################################
window.CanvasManager = 
	mutex: false
	ctx: null
	canvas: null
	height: 0
	width: 0
	inside: false
	initCanvas: (id)->
		self = @
		@canvas = canvas = document.getElementById("#{id}")
		canvas.clear = true
		log 'ppppppppp========='
		canvas.width = $("##{id}").parent().outerWidth( true )
		canvas.height = $("##{id}").parent().outerHeight( true )
		@ctx = ctx = canvas.getContext("2d")
		@height = height = canvas.height
		@width = width = canvas.width
		
		@brush = brush = new sketchy(ctx)
		@insid = inside = false

		$(window).mouseenter((event) ->
			self.inside = true
			self.brush.strokeStart( event.pageX, event.pageY )
		)
		$(window).mousemove((event)->
			[x,y] = self.getPosition(event)
			log inside
			log self.brush
			if(inside)
				self.brush.stroke( event.pageX, event.pageY )
			else
				self.inside=true
				self.brush.strokeStart( event.pageX, event.pageY )
		)
		$(window).mouseout((event)->
			self.brush.strokeEnd()
		)

	getPosition:(e)->
		if (e.pageX || e.pageY)
		  x = e.pageX
		  y = e.pageY
		else
		  x = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft 
		  y = e.clientY + document.body.scrollTop + document.documentElement.scrollTop
		x -= @canvas.offsetLeft
		y -= @canvas.offsetTop
		return [x,y]

$(document).ready(->
	window.CanvasManager.initCanvas("bg_header")
)



















log = console.log.bind(console)

#############################################
#  PROFILE
#############################################
window.CanvasManager =
	mutex: false
	ctx: null
	canvas: null
	height: 0
	width: 0
	inside: false
	initCanvas: (id)->
		self = @
		@canvas = canvas = document.getElementById("#{id}")
		canvas.clear = true
		log 'ppppppppp========='
		canvas.width = $("##{id}").parent().outerWidth( true )
		canvas.height = $("##{id}").parent().outerHeight( true )
		@ctx = ctx = canvas.getContext("2d")
		@height = height = canvas.height
		@width = width = canvas.width
		
		@brush = brush = new sketchy(ctx)
		@insid = inside = false

		$(window).mouseenter((event) ->
			self.inside = true
			self.brush.strokeStart( event.pageX, event.pageY )
		)
		$(window).mousemove((event)->
			[x,y] = self.getPosition(event)
			log inside
			log self.brush
			if(inside)
				self.brush.stroke( event.pageX, event.pageY )
			else
				self.inside=true
				self.brush.strokeStart( event.pageX, event.pageY )
		)
		$(window).mouseout((event)->
			self.brush.strokeEnd()
		)

	getPosition:(e)->
		if (e.pageX || e.pageY)
		  x = e.pageX
		  y = e.pageY
		else
		  x = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft 
		  y = e.clientY + document.body.scrollTop + document.documentElement.scrollTop
		x -= @canvas.offsetLeft
		y -= @canvas.offsetTop
		return [x,y]

$(document).ready(->
	window.CanvasManager.initCanvas("bg_header")
)