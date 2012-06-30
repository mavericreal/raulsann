less_file = "/../public/stylesheets/less/app"
dirname = File.dirname(__FILE__)

def build(f)
	begin
		puts f[1]
		puts f[0]
		puts f[2]
		dirname = File.dirname(__FILE__)
		system("lessc #{f[0]} > #{dirname}/../../#{f[1]}.css")
	rescue Exception => exc
		puts 'error'
		puts exc
	end
end

begin
	watch( "^(.*)\.less" )  {|f| build(f)}
rescue Exception => exc
	puts 'error'
	puts exc
end