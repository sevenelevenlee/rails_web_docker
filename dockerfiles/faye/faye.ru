# This file is used by faye servers to start the application.
# rackup faye.ru -E production -s thin
require 'faye'
require File.expand_path("../faye_token.rb", __FILE__)

class ServerAuth
  def incoming(message, callback)
    if message['channel'] !~ %r{^/meta/}
      if message['ext']['auth_token'] != FAYE_TOKEN
        message['error'] = 'Invalid authentication token'
      end
    end
    callback.call(message)
  end
end
Faye::WebSocket.load_adapter('thin')
faye = Faye::RackAdapter.new(:mount => '/faye', :timeout => 25)
# faye = Faye::RackAdapter.new(:mount => '/faye', engine: {type: Faye::Redis, host: '0.0.0.0'}, :timeout => 25)
faye.add_extension(ServerAuth.new)
# faye.listen(9292)
run faye
#注意,mount参数会决定文件的名称，比如 :mount => "/test", 那么引用js文件的时候，应该是 http://host.name:port/test.js
