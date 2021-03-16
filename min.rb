require 'webrick'
require 'drb'
require 'irb'

IRB.setup(eval("__FILE__"), argv: [])
DRb.start_service('druby://:54345', IRB::WorkSpace.new())

body = <<-HTML
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Probably</title>
  </head>
  <body>
    <h1>きっと動いてます！</h1>
    #{DRb.uri}
  </body>
</html>
HTML

$server = WEBrick::HTTPServer.new({ Port: 8000 })
$server.mount_proc('/') do |req, res|
  res.content_type = 'text/html'
  res.body = body
end

trap(:INT) { $server.shutdown }
$server.start
