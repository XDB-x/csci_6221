h1 Show User
p = user.first_name
p = user.last_name
p = user.email
p = user.password
p
  == link_to("Back", "/users", class: "btn btn-light btn-sm")
  == link_to("Edit", "/users/#{user.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/users/#{user.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
