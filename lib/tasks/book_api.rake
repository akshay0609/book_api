require "#{Rails.root}/config/environment.rb"

namespace :book_api do
  desc "Get token for api access"
  task :get_user_token, [:name] do |t, args|
    raise "The user name must be specified" unless args.name
    user = User.find_by(name: args.name)
    raise "The user #{args.name} could not be found." unless user
    puts "#{user.auth_token}"
  end

  desc "Create new user"
  task :create_user, [:name] do |t, args|
    raise "The user name must be specified" unless args.name
    
    user = User.create(name:args.name)
    raise "The user #{args.name} could not be created." unless user
    if user.valid?
      puts "User created successfully"
    else
      puts "#{user.errors.messages}"
    end
  end
end