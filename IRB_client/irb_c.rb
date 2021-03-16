require 'drb'
require 'irb'

uri = ARGV.shift

DRb.start_service
IRB.setup(eval("__FILE__"), argv: [])
workspace = DRbObject.new_with_uri(uri)
IRB.conf[:INSPECT_MODE] = false
IRB::Irb.new(workspace).run(IRB.conf)
