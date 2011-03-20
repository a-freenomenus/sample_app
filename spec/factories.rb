Factory.define :user do |user|
  user.name                   'Michael Mich'
  user.email                  't@t.com'
  user.password               'password'
  user.password_confirmation  'password'
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end
