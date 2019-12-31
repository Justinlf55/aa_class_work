# json.gifts do
#   @gifts.each do |gift|
#     json.set! gift.id do
#       json.extract! gift, :title, :description
#     end
#   end
# end

json.array! @gifts do |gift|
  json.title gift.title
  json.description gift.description
end