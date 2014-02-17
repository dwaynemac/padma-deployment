# configuration example
PADMA_DEPLOYMENT = {
  staging: {
    server: :heroku
    remote_name: :staging
    force_push: true
  },
  production: {
    server: :ec2
    remote_name: :production
    force_push: false
  }
}
