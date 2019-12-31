
json.array! @guests do |guest|
  json.name guest.name
  json.age guest.age
end

# json.guests do
#   @guests.each do |guest|
#     json.partial! 'guest', guest: guest
#   end
# end