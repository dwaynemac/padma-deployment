require "#{Rails.root}/config/deployment_configuration"

# TODO see rugged gem for a better implementation of ruby commands
namespace :deploy do

  task :test_configuration do
    puts PADMA_DEPLOYMENT.inspect
  end

  desc "deploys to staging server"
  task :staging do
    puts "====> deploying to staging..."
    run 'git checkout master'
    run 'git pull'
    if rebase_to_master('staging')
      deploy(:staging)
    end
    run 'git checkout master'
  end

  desc "deploys to production server"
  task :production do
    puts "====> deploying to production..."
    run 'git checkout master'
    run 'git pull'
    if rebase_to_master('production')
      deploy(:production)
    end
    run 'git checkout master'
  end

end

def run(comand)
  puts comand
  `#{comand}`
  if $?.success?
    true
  else
    raise "'#{comand}' failed. finishing..."
  end
end

def rebase_to_master(branch_name)
  if local_branch_exists?(branch_name)
    run "git checkout #{branch_name}"
    run 'git rebase master'
  else
    run "git checkout -b #{branch_name}"
  end
end

# @return [Boolean]
def local_branch_exists?(branch_name)
  `git show-ref --verify --quiet refs/heads/#{branch_name}`
  $?.success?
end

def deploy(environment)
  server = PADMA_DEPLOYMENT[environment][:server] || (environment==:staging)? :heroku : :ec2
  remote = PADMA_DEPLOYMENT[environment][:remote_name] || environment
  if PADMA_DEPLOYMENT[environment][:force_push]
    force = "--force"
  end
  case server
  when :heroku
    `git push #{remote} #{environment}:master #{force}`
    `git push origin #{environment}:#{environment} #{force}`
  when :ec2
    `git push origin #{environment}:#{environment} #{force}`
    puts "you can ssh to server to deploy"
  end
end
