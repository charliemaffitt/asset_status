desc 'Deploy Safely to Heroku'
task :deploy do
  sh "heroku pgbackups:capture --expire --app sorbaassets"
  sh "heroku run rake db:migrate db:seed --app sorbaassets"
  sh "heroku restart --app sorbaassets"
  sh "curl -o /dev/null http://sorbaassets.herokuapp.com"
end
