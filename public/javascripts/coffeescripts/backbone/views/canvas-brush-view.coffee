log = console.log.bind(console)

##################################
#  MODEL VIEW
##################################
window.CanvasBrushView = Backbone.View.extend(
	className: 'bg'
	events:
		'mouseenter': 'mouseenterEffect'
		'mousemove': 'mousemoveEffect'
		'mouseout': 'mouseoutEffect'
	initialize: ->
		self = this
		@mutex = false
		@inside = false
		@canvas = @el
		@canvas.clear = true
		@canvas.width = @$el.parent().outerWidth( true )
		@canvas.height = @$el.parent().outerHeight( true )
		@ctx = @canvas.getContext("2d")
		@height = @canvas.height
		@width = @canvas.width

		@brush = new sketchy(@ctx,[107, 154, 253])
	mouseenterEffect: (e) ->
		@inside = true
		[x,y] = @getPosition(e)
		@brush.strokeStart( x, y )
	mousemoveEffect: (e)->
		[x,y] = @getPosition(e)
		if(@inside)
			@brush.stroke(e.pageX, e.pageY )
		else
			@inside=true
			@brush.strokeStart(e.pageX, e.pageY )
	mouseoutEffect: (e) ->
		@brush.strokeEnd()
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
)
