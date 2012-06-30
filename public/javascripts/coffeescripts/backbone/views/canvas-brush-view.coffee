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
		'mousedown': 'mousedownEffect'
		'mouseup': 'mouseupEffect'
	initialize: ->
		log 'initaaa'
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
		@sections = @options.sections
		@color = @sections[0][1]

		@brush = new sketchy(@ctx,@color)
	mouseenterEffect: (e) ->
		@inside = true
		@updatePosition(e)
		@updateColor()
		@brush.strokeStart( @x, @y )
	mousemoveEffect: (e)->
		@updatePosition(e)
		@updateColor()
		if(@inside)
			@brush.stroke(@x, @y)
		else
			@inside=true
			@brush.strokeStart(@x, @y)
	mouseoutEffect: (e) ->
		@updateColor()
		@brush.strokeEnd()
	mousedownEffect: (e) ->
		@brush.brush_pressure = 0
		@ctx.globalCompositeOperation = 'copy'
	mouseupEffect:(e)->
		@brush.brush_pressure = 2
		@ctx.globalCompositeOperation = 'source-over'
	updatePosition:(e)->
		if (e.pageX || e.pageY)
		  @x = e.pageX
		  @y = e.pageY
		else
		  @x = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft 
		  @y = e.clientY + document.body.scrollTop + document.documentElement.scrollTop
		#@x -= @$el.offset().left
		#@y -= @$el.offset().top
	updateColor:->
		try
			self = this
			s= _.find(
				@sections 
				(n)->
					n['offset'][0] < self.y < n['offset'][1]
			)
			@color = s['color']
			@brush.color = @color
	clean:->
		@brush.destroy()
		@ctx.clearRect(0, 0, @width, @height)
		@brush = new sketchy(@ctx,@color)
)
