set :user, 'clients'
set :domain, 'digiway.tk'
set :application, 'depot'

set :deploy_server, '188.64.170.168'

set :repository, 'git@github.com:whiteskull/store.git'
set :deploy_to, "/var/www/#{user}/data/www/#{domain}"

role :app, deploy_server
role :web, deploy_server
role :db, deploy_server, :primary => true

set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false
set :rails_env, :production

set :rvm_ruby_string, '1.9.3'

namespace :deploy do
  desc "cause Passenger to initiate a restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  end
end
