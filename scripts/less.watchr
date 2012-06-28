less_file = "/../public/stylesheets/less/app"
dirname = File.dirname(__FILE__)

def build(f)
	begin
		puts 'pppppppppppppppppppppppppp[[[[['
		puts f



		system("lessc #{f[0]} > #{dirname}/../../#{f[1]}.css")
	rescue Exception => exc
		puts 'error'
		puts exc
	end
end

begin
	
	puts dirname
	expression = "#{dirname}#{less_file}/(.*)\.less"
	puts expression
	expression = '^/Users/ufreeurself/Sites/raulsann/code/git/raulsann/public/stylesheets/less/app/(.*)\.less'
	puts expression
	puts "++++++++++++++++++++++"
	watch( '^/Users/ufreeurself/Sites/raulsann/code/git/raulsann/public/stylesheets/less/app/(.*)\.less' )  {|f| build(f)}
rescue Exception => exc
	puts 'error'
	puts exc
end