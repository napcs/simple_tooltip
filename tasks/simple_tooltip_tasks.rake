namespace :simple_tooltip do
  desc "copy simple_tooltip files into your public folder"
  task :install => :environment do
    Dir.chdir("#{RAILS_ROOT}/vendor/plugins/simple_tooltip/public/javascripts") do
      FileUtils.copy("tooltip.js", "#{RAILS_ROOT}/public/javascripts")
    end
  end
  desc "Remove simple_tooltip files from your public folder"
  task :uninstall => :environment do
    Dir.chdir("#{RAILS_ROOT}/public") do
      FileUtils.rm("javascripts/tooltip.js")
    end
  end
  
  
end