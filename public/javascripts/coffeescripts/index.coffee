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
	initCanvas: (id,sections)->
		@canvasBrushView = new window.CanvasBrushView(
			el:$("##{id}")
			id: id
			sections:sections
		)
	cleanCanvas:->
		@canvasBrushView.clean()
	duplicateLinks:->
		$('#sections a').each(->
			link = $(@).clone()
			log link
			top = $(@).offset().top
			left = $(@).offset().left
			$(link).css('top',top)
			$(link).css('left',left)
			$(link).css('position','absolute')
			$(link).addClass('absolute_link')
			log link
			log '[[[[[[[[[[[[['
			$('body').append($(link))
		)
	init: ()->
		self = this
		i = 0
		colors = [
			[0,0,0],
			[250,250,250],
			[250,250,250],
			[250,250,250],
			[250,250,250],
			[250,250,250],
			[250,250,250],
			[250,250,250],
			[0,0,0],
			[0,0,0]
		]

		sections_array =[]
		sections_array.push({'id':$('header').attr('id'),'color':colors[i],'offset':[$(header).offset().top,$(header).offset().top+$(header).outerHeight()]})
		i++
		$('section').each(->
			sections_array.push({'id':$(@).attr('id'),'color':colors[i],'offset':[$(@).offset().top,$(@).offset().top+$(@).outerHeight()]})
			i++
		)
		@initCanvas('bg',sections_array)

		$('#clean').click(->
			self.cleanCanvas()
		)

		@duplicateLinks()

		

$(document).ready(->
	window.CanvasManager.init()
)
