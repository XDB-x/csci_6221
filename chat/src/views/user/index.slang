.row
  .col-sm-11
    h2 Users
  .col-sm-1
    a.btn.btn-success.btn-sm href="/users/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th First_name
        th Last_name
        th Email
        th Password
        th Actions
    tbody
      - users.each do |user|
        tr
          td = user.first_name
          td = user.last_name
          td = user.email
          td = user.password
          td
            span
              == link_to("Show", "/users/#{user.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/users/#{user.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/users/#{ user.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
