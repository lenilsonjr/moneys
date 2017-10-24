namespace :dev do
  
    require 'colorize'
  
    desc "Prepara ambiente de desenvolvimento"
    task setup: :environment do
  
      tasks = %w[ g_users ]
  
      puts "[ ] - Setting up development enviroment".yellow
  
      puts "[ ] - Rebuilding database".yellow
      %x(rake db:reset)
      puts "[X] - Rebuilding database".green
  
      tasks.each do |task|
  
        puts " "
        puts %x(rake dev:#{task})
        puts " "
  
      end
  
      puts "[X] - Setting up development enviroment".green
  
      puts " "
      puts %x(rake dev:auth)
    end
  
    desc "Setup mockup users"
    task g_users: :environment do
  
      puts "[ ] - Creating user accounts and roles".yellow
  
      Role.create(name: :admin)
      Role.create(name: :owner)
      
      User.create!(
        email: "admin@demo.com",
        name: Faker::Name.name,
        password: "123456",
        password_confirmation: "123456"
      )

      User.last.add_role(:admin)

      User.create!(
        email: "user@demo.com",
        name: Faker::Name.name,
        password: "123456",
        password_confirmation: "123456"
      )

      User.last.add_role(:owner)      

      puts "[X] - Users created".green
  
    end
  
    desc "Show application logins"
    task auth: :environment do
  
      puts "Here are some logins for you...".red
  
      User.all.each do |user|
  
        puts "#{user.name}: #{user.email}".white.on_blue
  
      end
      
      puts "All passwords are 123456".red

    end
  
  end
  