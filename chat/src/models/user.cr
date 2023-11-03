class User < Granite::Base
  connection pg
  table users

  column id : Int64, primary: true
  column first_name : String?
  column last_name : String?
  column email : String?
  column password : String?
  timestamps
end
