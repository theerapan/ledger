set :port, 22
set :user, 'deploy' # e.g. 'deploy'
set :deploy_via, :remote_cache
set :use_sudo, false
set :branch, 'master' # e.g. 'master'

server '156.67.214.227',
  roles: [:web, :app, :db],
  port: fetch(:port),
  user: fetch(:user),
  primary: true

set :deploy_to, "/var/apps/#{fetch(:application)}" # e.g. "/var/apps/rails_blog"

set :ssh_options, {
  forward_agent: true,
  auth_methods: %w(publickey),
  user: 'deployer',
}

set :rails_env, :production
set :conditionally_migrate, true