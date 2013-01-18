ssh_options[:forward_agent] = true
default_run_options[:shell] = false

set :user, 'root'
set :domain, 'digiway.tk'
set :application, 'depot'

set :deploy_server, '188.64.170.168'

set :repository, 'git@github.com:whiteskull/store.git'
set :deploy_to, "/var/www/clients/data/www/#{domain}"

role :app, deploy_server
role :web, deploy_server
role :db, deploy_server, :primary => true

set :deploy_via, :remote_cache

set :rake, 'rake'
set :scm, 'git'
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false
set :rails_env, :production

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

after 'deploy:setup', :after_setup
task :after_setup, roles => :app do
  run "chmod 777 -R #{shared_path}/log"
  run "mkdir #{shared_path}/uploads"
  run "chmod 777 #{shared_path}/uploads"
end

after 'deploy:update_code', :after_update_code
after 'deploy:migrations', :after_update_code
after 'deploy:update', :after_update_code
task :after_update_code, roles => :app do
  run "chmod 777 -R #{release_path}/tmp"
  run "ln -s #{shared_path}/uploads #{release_path}/public/uploads"
end
