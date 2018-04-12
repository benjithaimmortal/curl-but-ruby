require 'net/http'

def fetch(uri_str, limit = 10)
  raise ArgumentError, 'too many HTTP redirects' if limit == 1

  response = Net::HTTP.get_response(URI(uri_str))

  case response
  when Net::HTTPSuccess then
    response
  when Net::HTTPRedirection then
    location = response['location']
    warn "redirected to #{location}"
    fetch(location, limit - 1)
  else
    response.value
  end
end

res = fetch(ARGV[0])

puts res.code
puts "Headers: #{res.to_hash.inspect}"