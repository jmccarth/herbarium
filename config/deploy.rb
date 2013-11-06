require 'bundler/capistrano'

set :application, "Herbarium"
set :repository,  "ssh://git@github.com/jmccarth/herbarium.git"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "env-rails.uwaterloo.ca"                          # Your HTTP server, Apache/etc
role :app, "env-rails.uwaterloo.ca"                          # This may be the same as your `Web` server
role :db,  "env-rails.uwaterloo.ca", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

set :user, 'jmccarth'
set :deploy_to, '/home/Sites/herbarium/'
ssh_options[:forward_agent] = true
default_run_options[:pty] = true
set :use_sudo, false

after "deploy:finalize_update", "deploy:symlink_config_files"
after "deploy:update_code", "deploy:migrate"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end

   	desc "Symlink shared config files"
	task :symlink_config_files do
		run "#{try_sudo} ln -fs #{ deploy_to }shared/config/database.yml #{release_path}/config/database.yml"
	end
end

