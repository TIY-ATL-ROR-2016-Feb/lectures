## Example of handling Github data


# response = @github.get_contributions
# usernames = []
# response.each do |user|
#   usernames.push(user["author"]["login"])
# end
# additions = []





response = @github.whatever
results = descrewify(response)











response = @github.get_the_stuff
results = []
response.each do |user|
  totals = process_user(user)
  results.push(totals)
end
results


results = []
response.each do |contributor|
  processed_data = get_user_totals(contributor)
  results.push(processed_data)
end

def get_user_totals(contributor)
  username = get_username(contributor)
  weeks = contributor["weeks"]
  additions = get_total(weeks, "a")
  deletions = get_total(weeks, "d")
  commits = get_total(weeks, "c")
end

def get_username(user)
  user["author"]["login"]
end







def process_user(user1)
  username = user1["author"]["login"]
  weeks = user1["weeks"]
  weeks.each do |week|
    additions = week["a"]
  end
  ### INCREASE MAGIIIC
  [username, total_additions, total_deletions, total_commits]
end
