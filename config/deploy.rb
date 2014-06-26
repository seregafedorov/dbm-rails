# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'dbm'
set :repo_url, 'git@github.com:mikebobrov/dbm-rails.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# namespace :deploy do
#
#   desc 'Restart application'
#   task :restart do
#     on roles(:app), in: :sequence, wait: 5 do
#       # Your restart mechanism here, for example:
#       # execute :touch, release_path.join('tmp/restart.txt')
#     end
#   end
#
#   after :publishing, :restart
#
#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       # within release_path do
#       #   execute :rake, 'cache:clear'
#       # end
#     end
#   end
#
# end


namespace :deploy do

  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  before :compile_assets, 'bower:update'

  after :finishing, 'deploy:cleanup'

end

namespace :bower do
  desc 'Update bower dependencies'
  task :update do
    on roles(:app) do
      within release_path do
        execute :bower, :install, '-f'
      end
    end
  end
end

namespace :unicorn do
  def run_unicorn
    set :unicorn_config, "#{current_path}/config/unicorn/#{fetch(:stage)}.rb"
    within "#{current_path}" do
      with rails_env: "#{fetch(:stage)}" do
        execute :bundle, :exec, :unicorn, "-c #{fetch(:unicorn_config)} -D"
      end
    end
    #execute "cd #{current_path} && RAILS_ENV=#{fetch(:stage)} && bundle ; echo $?;"
    #execute "#{current_path}/bin/unicorn_rails", ""
  end

  desc 'Start unicorn'
  task :start do
    on roles(:app) do
      run_unicorn
    end
  end

  desc 'Stop unicorn'
  task :stop do
    on roles(:app) do
      if test "[ -f #{fetch(:pid_file_path)} ]"
        execute :kill, "-QUIT `cat #{fetch(:pid_file_path)}`"
      end
    end
  end

  desc 'Force stop unicorn (kill -9)'
  task :force_stop do
    on roles(:app) do
      if test "[ -f #{pid_file_path} ]"
        execute :kill, "-9 `cat #{fetch(:pid_file_path)}`"
        execute :rm, fetch(:pid_file_path)
      end
    end
  end

  desc 'Restart unicorn'
  task :restart do
    on roles(:app) do
      if test "[ -f #{fetch(:pid_file_path)} ]"
        execute :kill, "-s USR2 `cat #{fetch(:pid_file_path)}`"
      else
        run_unicorn
      end
    end
  end
end
