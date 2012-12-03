require "bundler/capistrano"
default_run_options[:pty] = true
set :application, "purpleline"
set :repository,  "git@github.com:itbakery/purpleline.git"
set :user, "admin"
set :scm, :git
set :run_method, :run
set :deploy_to, "/home/admin/#{application}"
set :scm_verbose,true
set :branch, "master"
#==== intetration with capistrano
#require 'rvm/capistrano'
set :rvm_type, :user
#set :rvm_ruby_string, "1.9.3"
set :rvm_bin_path, "/home/admin/.rvm/bin"
#set :rvm_ruby_string, "ruby-1.9.3-p286@purpleline"
#set :rvm_ruby_string, "ruby-1.9.3-p327@purpleline"

set :deploy_via, :remote_cache
ssh_options[:port] = 8022
ssh_options[:forward_agent] = true
role :web, "203.146.127.131"
role :app, "203.146.127.131"
role :db,  "203.146.127.131", :primary => true


# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end

task :after_update_code, :roles => :app do
  %w{uploads  avatars swfs ckeditor_assets map icons system report}.each do |share|
    run "rm -rf #{release_path}/public/#{share} "
    run "mkdir -p #{shared_path}/purple/#{share} "
    run "ln -nfs #{shared_path}/purple/#{share} #{release_path}/public/#{share} "
  end
end

 desc "Config Search"
  task :search_config, :roles => :app do
    run "cd #{current_path} && rake ts:config RAILS_ENV=production"
  end

  desc "Start Search"
  task :search_start, :roles => :app do
    run "cd #{current_path} && rake ts:start RAILS_ENV=production"
  end

  desc "Stop Search"
  task :search_stop, :roles => :app do
    run "cd #{current_path} && rake ts:stop RAILS_ENV=production"
  end

  desc "Rebuild Search"
  task :search_rebuild, :roles => :app do
    run "cd #{current_path} && rake ts:stop RAILS_ENV=production"
    run "cd #{current_path} && rake ts:config RAILS_ENV=production"
    run "cd #{current_path} && rake ts:index RAILS_ENV=production"
    run "cd #{current_path} && rake ts:start RAILS_ENV=production"
  end

  desc "Index Search"
  task :search_index, :roles => :app do
    run "cd #{current_path} && rake ts:in RAILS_ENV=production"
  end
  
  desc "Re-establish symlinks"
  task :copy_sphinx do
    run <<-CMD
      rm -rf #{current_path}/db/sphinx &&
      ln -nfs #{shared_path}/db/sphinx #{current_path}/db/sphinx 
    CMD
  end

end

