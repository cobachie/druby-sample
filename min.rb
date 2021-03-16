require 'webrick'

body = <<-HTML
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Probably</title>
  </head>
  <body>
    <h1>きっと動いてます！</h1>
  </body>
</html>
HTML

$server = WEBrick::HTTPServer.new({ Port: 8000 })
$server.mount_proc('/') do |req, res|
  res.content_type = 'text/html'
  res.body = body
end
$server.start

trap(:INT) { $server.shutdown }
