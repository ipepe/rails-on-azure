
REM Put Ruby in Path
SET PATH=%PATH%;D:\home\site\deployments\tools\rails-on-azure\ruby\bin
SET RAILS_ENV=production

echo Copy necessary config files for azure
copy D:\home\site\deployments\tools\azure-deploy\start-rails.cmd %DEPLOYMENT_SOURCE%\start-rails.cmd
copy D:\home\site\deployments\tools\azure-deploy\web.config %DEPLOYMENT_SOURCE%\web.config

echo Need to be in Reposistory
cd %DEPLOYMENT_SOURCE%
cd

Echo checking if bundler is installed
call gem list -i bundler
IF %ERRORLEVEL% NEQ 0 (
  echo Bundler is not installed. Doing it now
  call gem install bundler --no-ri --no-rdoc
)

ECHO calling Bundle install --without development test
call bundle install --without development test
call bundle exec rake db:migrate
IF %ERRORLEVEL% NEQ 0 (
  call bundle exec rake db:create db:schema:load
)
