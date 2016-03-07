require "pry"
require "net/http"
require "json"

def list_gists(username)
  uri = URI("https://api.github.com/users/#{username}/gists")
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

def show_gist_file(gist_id, filename)
  uri = URI("https://api.github.com/gists/#{gist_id}")
  response = Net::HTTP.get(uri)
  parsed_data = JSON.parse(response)
  puts parsed_data["files"][filename]["content"]
end

show_gist_file("1c6248e5eaf22e4eb206", "install.md")
