namespace :deploy do

  desc "deploys to staging server"
  task :staging do
    puts "deploying to staging..."
    `git checkout master`
    `git pull`
    `git fetch`
    `git checkout staging`
    `git rebase master`
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
    `git checkout production`
    `git rebase master`
    `git push origin production:production`
    `git checkout master`
    puts "you can ssh to serve to deploy"
  end

end
