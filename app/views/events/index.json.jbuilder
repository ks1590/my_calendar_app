json.array! @events do |event|
  json.id event.id
  json.date event.date
  json.title event.title
  json.amount event.amount
  json.note event.note
end