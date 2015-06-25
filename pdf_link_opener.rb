#/usk/bin/env ruby
require 'watir-webdriver' 
require 'io/console'
require 'pdf-reader'
require 'uri'

begin
puts 'What Instructor should we use? (Name is case-sensitive)'

inst = gets.chomp.to_s
path = 	'/home/josh/'							#'C:\Users\jmcdon39\Brautigam 400.766 China In Africa SP15.pdf'

f = path + inst + ".pdf"

`pdftotext #{f} #{f}.tmp; egrep -ao 'https?://[^ ]+' #{f}.tmp >> #{f}.txt`
end
d = []
e = []
reader = PDF::Reader.new(f)
a = reader.pages.each do |page|
    c = page.text
	d << URI.extract(c, "http")
end

d = d.flatten.to_s.split(/ /)

d.each do |i| 
	unless i.empty?
	e << i.gsub(/"/, '').gsub(/,/, '').gsub(/\]/, '').gsub(/\[/, '')

	end
end

bb = Watir::Browser.new 

e.each do |i| 
	bb.goto(i)
	bb.execute_script("window.open()")
	bb.windows.last.use
	next
end

=begin
	bb.goto(i)
	bb.execute_script("window.open()")
	bb.windows.last.use
		#if i.include?(".pdf")
		#	`wget #{i}`
		#end

end

=end
