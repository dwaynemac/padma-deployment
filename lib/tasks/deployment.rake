# TODO see rugged gem for a better implementation of ruby commands
namespace :deploy do

  desc "deploys to staging server"
  task :staging do
    puts "====> deploying to staging..."

    `git checkout master`
    `git pull`
    `git fetch`
    if local_branch_exists?('staging')
      `git checkout staging`
      `git rebase master`
    else
      `git checkout -b staging`
    end
    `git push staging staging:master --force`
    `git push origin staging:staging --force`
    `git checkout master`
  end

  desc "deploys to production server"
  task :production do
    puts "updating origin/production..."
    `git checkout master`
    `git pull`
    `git fetch`
    if local_branch_exists?('production')
      `git checkout production`
      `git rebase master`
    else
      `git checkout -b production`
    end
    `git rebase master`
    `git push origin production:production`
    `git checkout master`
    puts "you can ssh to serve to deploy"
  end

end

# @return [Boolean]
def local_branch_exists?(branch_name)
  `git show-ref --verify --quiet refs/heads/#{branch_name}`
  $?.success?
end
