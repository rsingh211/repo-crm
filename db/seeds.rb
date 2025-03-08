AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Customer.create!([
  { full_name: "Alice Johnson", phone_number: "123-456-7890", email: "alice@example.com", notes: "Regular customer" },
  { full_name: "Bob Smith", phone_number: "987-654-3210", email: "", notes: "Prefers calls" },
  { full_name: "Charlie Brown", phone_number: "555-555-5555", email: "charlie@example.com", notes: "VIP customer" }
])
