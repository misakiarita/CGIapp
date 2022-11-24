require 'webrick'

server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}

server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'kadai.html.erb')

server.mount('/test', WEBrick::HTTPServlet::ERBHandler, 'kadai.html.erb')

server.mount('/ggoya.cgi', WEBrick::HTTPServlet::CGIHandler, 'givefor_pg.rb')

server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'givefor.rb')

server.mount('/ggquality.cgi', WEBrick::HTTPServlet::CGIHandler, 'quality_pg.rb')

server.mount('/gquality.cgi', WEBrick::HTTPServlet::CGIHandler, 'quality.rb')


server.start