namespace :categories do

  desc "Populate categories"
  task :populate => :environment do
 ["Local", "Sports", "Weather", "Crime", "Business", "Government", "Lifestyles", "Events"].each do |name|
      Category.create({
        name: name,
        }
      ) unless Category.where(name: name).exists?
    end
    puts "Updated Categories"
  end
end