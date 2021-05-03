# json.id event.id
json.date event.date
json.title "#{event.category.name} : #{number_to_currency(event.amount, :locale => "ja")}"
# json.amount event.amount
# json.note event.note
json.update_url event_path(event, method: :patch)
json.edit_url edit_event_path(event)