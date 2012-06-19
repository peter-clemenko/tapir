require 'fileutils'

namespace :setup  do
  desc "initial setup"
  task :initial => :environment do
    
    # Pull down geolitecity database
    puts "Getting Geolitecity database..."
    `#{Rails.root}/data/get_latest.sh`

    # Copy database.yml
    puts "Copying database.yml into place..."
    FileUtils.cp_r("#{Rails.root}/config/database.yml.sample", "#{Rails.root}/config/database.yml")    

    # Copy ear_api_keys.yml
    puts "Copying ear_api_keys.yml into place..."
    FileUtils.cp_r("#{Rails.root}/config/ear_api_keys.yml.sample", "#{Rails.root}/config/ear_api_keys.yml")    

    # rake db:migrate
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke

  end
end
