require 'grpc'
require './hello/hello_services_pb'

def main
  stub = Hello::Greeter::Stub.new('localhost:50051', :this_channel_is_insecure)
  user = ARGV.size > 0 ?  ARGV[0] : 'world'
  message = stub.say_hello(Hello::HelloRequest.new(name: user)).message
  p "Greeting: #{message}"
end

main
