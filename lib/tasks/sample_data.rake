require 'faker'

namespace :db do
  desc 'Fill db with sample data'
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:name => 'Example User',
                 :email => 'example@example.by',
                 :password => 'password',
                 :password_confirmation => 'password')
    admin = User.create!(:name => 'Leaser Geen',
                         :email => 'leaser.geen@gmail.com',
                         :password => 'password',
                         :password_confirmation => 'password')
    admin.toggle!(:admin)

    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@example.by"
      password = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
      
    end

    User.all(:limit => 6).each do |user|
      50.times do
        user.microposts.create!(:content => Faker::Lorem.sentence(5))
      end

    end
  end
end
