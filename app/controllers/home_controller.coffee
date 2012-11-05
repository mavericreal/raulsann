before 'protect from forgery', ->
    protectFromForgery '70aaa5e5ff2288167d6f2d4bfb3685ad01863e7b'

action('index', ->
	render({title:"Raul San", layout:false})
)