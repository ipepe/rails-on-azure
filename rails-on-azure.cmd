SET OLD_DIRECTORY=%cd%

IF NOT DEFINED DEPLOYMENT_SOURCE (
  SET DEPLOYMENT_SOURCE=%~dp0%.
)
REM set rails directory to git_root\rails
REM SET DEPLOYMENT_SOURCE=%DEPLOYMENT_SOURCE%\rails

cd D:\home\site\deployments\tools

if not exist azure-deploy (
  curl -o azure-deploy.zip -L https://raw.githubusercontent.com/ipepe/rails-on-azure/master/azure-deploy.zip
  d:\7zip\7za x -y azure-deploy.zip > azure-deploy-unpack.log
)

ECHO CALLING GET-RUBY
call azure-deploy\get-ruby.cmd
ECHO CALLING AFTER-GET-RUBY
call azure-deploy\after-get-ruby.cmd
ECHO WE MADE IT

if not exist D:\home\site\deployments\tools\deploy.cmd (
    cd D:\home\site\deployments\tools
    copy azure-deploy\deploy.cmd .\deploy.cmd
    rem curl -o deploy.cmd -L https://raw.githubusercontent.com/KuduApps/CSharp6Web/master/deploy.cmd
)

cd %OLD_DIRECTORY%
call D:\home\site\deployments\tools\deploy.cmd
