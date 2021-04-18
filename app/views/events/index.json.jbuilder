json.array! @events do |event|
  json.id event.id
  json.date event.date
  json.title "#{event.title} : #{event.amount}円"
  json.amount event.amount
  json.note event.note
  json.update_url event_path(event, method: :patch)
  json.edit_url edit_event_path(event)
end