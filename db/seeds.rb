start_date = Date.parse("2021/01/01")
end_date = Date.parse("2021/05/31")
method_name = [1, 2, 3, 4, 5, 6]
payee_name = [1, 2, 3, 4, 5, 6, 7, 9]

100.times do |n|
  month_name = Random.rand(start_date .. end_date)
  month = month_name
  method = method_name.sample
  payee = payee_name.sample
  amount = Faker::Number.within(range: 100..20000)

  Event.create!(
    date: month,
    category_id: payee,
    payment_id: method,
    amount: amount
  )
end