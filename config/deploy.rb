require 'bundler/capistrano'

# $:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
# require "rvm/capistrano"                  # Load RVM's capistrano plugin

set :application, "flames_server"
set :repository,  "git@git.batnag.org:flames.git"

set :scm, :git

role :web, "eregion.batnag.org"                           # Your HTTP server, Apache/etc
role :app, "eregion.batnag.org"                           # This may be the same as your `Web` server
role :db,  "eregion.batnag.org", :primary => true         # This is where Rails migrations will run

set :deploy_to,   "/opt/apps/#{application}"
set :deploy_via,  :remote_cache

set :user, "deploy"
set :use_sudo, false
set :ssh_options, { :forward_agent => true }

set :rails_env, "production"

namespace :db do
  task :symlink, :except => { :no_release => true } do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
after "deploy:finalize_update", "db:symlink"