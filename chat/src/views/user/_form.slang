- if user.errors
  ul.errors
    - user.errors.each do |error|
      li = error.to_s

== form(action: "/users/#{user.id.to_s}", method: user.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "first_name", value: user.first_name, placeholder: "First_name", class: "form-control")
  .form-group
    == text_field(name: "last_name", value: user.last_name, placeholder: "Last_name", class: "form-control")
  .form-group
    == text_field(name: "email", value: user.email, placeholder: "Email", class: "form-control")
  .form-group
    == text_field(name: "password", value: user.password, placeholder: "Password", class: "form-control")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/users", class: "btn btn-light btn-sm")
