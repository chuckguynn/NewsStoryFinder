namespace :stories do

  desc "Populate stories"
  task :populate => :environment do
      Category.all.each do |category|
      	Story.create({
        title: "Loerm ipsum",
        category_id: category.id,
        user_id: 1,
        description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
        :image => File.open("#{Rails.root}/app/assets/images/#{category.name}.jpeg")
        }
      )
    end
    puts "Poulated Stories"
  end
end