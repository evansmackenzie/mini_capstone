User.create!([
  {name: "Mackenzie", email: "me@gmail.com", password_digest: "$2a$12$N4RzxHHZ9HkwYIiwiqetaO72toMOwb7HrZqui1jdUAPRju9yBwjq.", admin: false},
  {name: "Vinny", email: "vs@gmail.com", password_digest: "$2a$12$d8i2at7q9oIrfyTgS.i1Tu5dh3cXj7ITv8RvtOaPXlTRDrZlB7yRq", admin: true},
  {name: "Helen", email: "h@gmail.com", password_digest: "$2a$12$v3a60XN63SOVTRNbnjyfVejV/v1Vw9V4sJQFZWOmCIEAPhpRsolmy", admin: false}
])
Supplier.create!([
  {name: "Petsmart", email: "pm@gmail.com", phone_number: "222-4444"},
  {name: "Chewy", email: "chewy@gmail.com", phone_number: "111-2222"}
])
Product.create!([
  {name: "pen", price: "1.0", description: "Lucy's favorite toy", inventory: 4, supplier_id: 1},
  {name: "spring_toy", price: "3.0", description: "Helen's favorite toy", inventory: 1, supplier_id: 1},
  {name: "mousey", price: "4.0", description: "Helen's second favorite toy", inventory: 3, supplier_id: 2},
  {name: "catnip", price: "6.0", description: "makes cats happy", inventory: 2, supplier_id: 1},
  {name: "red rope", price: "15.0", description: "Alice's tug'o'war opponent", inventory: 1, supplier_id: 2}
])
Category.create!([
  {name: "Lucy's things"},
  {name: "Helen's things"},
  {name: "Alice's things"}
])
Image.create!([
  {url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQarsyy4lUkiySz7OLrjvVXFUbKzhyYiJf7E94xM07HCItpuf0&usqp=CAc", product_id: 1},
  {url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmhUj3bGj-udtQ-rbjrokoSndPJFYl55_ajHL0OTpCFHekEo7vwl1IbTJHntIfr3xfhKSoD60&usqp=CAc", product_id: 3},
  {url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqkAakcswPwzQDciFIE2X5kH8w4iu9LNjxdBhHE84JB4b-_o8&usqp=CAc", product_id: 2},
  {url: "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSL2tvLyznOyLq5QlaFWZ_6al0SqJYyfcTu7i7GS7T1Nn5l0ded1lU9ezl64EHVJq8wz-05vLHFXQ&usqp=CAc", product_id: 3},
  {url: "data:image/jpeg;base64,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", product_id: 2}
])
Order.create!([
  {user_id: 1, subtotal: nil, tax: nil, total: nil},
  {user_id: 1, subtotal: nil, tax: nil, total: nil},
  {user_id: 2, subtotal: nil, tax: nil, total: nil},
  {user_id: 2, subtotal: "18.0", tax: "1.62", total: "19.62"},
  {user_id: 2, subtotal: "16.0", tax: "1.44", total: "17.44"},
  {user_id: 2, subtotal: "16.0", tax: "1.44", total: "17.44"},
  {user_id: 2, subtotal: "16.0", tax: "1.44", total: "17.44"},
  {user_id: 2, subtotal: "6.0", tax: "0.54", total: "6.54"}
])
CartedProduct.create!([
  {user_id: 1, product_id: 1, quantity: 1, status: "carted", order_id: nil},
  {user_id: 1, product_id: 1, quantity: 1, status: "carted", order_id: nil},
  {user_id: 2, product_id: 1, quantity: 1, status: "purchased", order_id: 8},
  {user_id: 2, product_id: 1, quantity: 1, status: "purchased", order_id: 8}
])
ProductCategory.create!([
  {product_id: 1, category_id: 2},
  {product_id: 3, category_id: 1},
  {product_id: 2, category_id: 2},
  {product_id: 5, category_id: 1},
  {product_id: 1, category_id: 1},
  {product_id: 5, category_id: 2}
])
