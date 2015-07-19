@ECHO off

REM Put Ruby in Path
SET PATH=%PATH%;D:\home\site\deployments\tools\rails-on-azure\ruby\bin
SET ROA_TOOLS_DIR=D:\home\site\deployments\tools\rails-on-azure

REM I am in the repository folder
pushd D:\home\site\deployments\tools
if not exist rails-on-azure md rails-on-azure
cd rails-on-azure
if exist ruby cd ruby
if exist bin cd bin
if exist ruby.exe goto end

echo No Ruby, need to get it!


ECHO START Unzipping rails-on-azure
cd D:\home\site\deployments\tools
rem if not exist rails-on-azure.7z
curl -o rails-on-azure.7z -L http://files.ipepe.pl/railsonazure/rails-on-azure_ruby-and-devkit_0-0-1.7z
d:\7zip\7za x -y rails-on-azure.7z > rails-on-azure-unpack.log
ECHO DONE Unzipping rails-on-azure

Echo configuring DK.rb
cd D:\home\site\deployments\tools\rails-on-azure\devkit
ruby dk.rb init
del config.yml
copy config.yml_bkp config.yml
ruby dk.rb install

REM Update Gem223 until someone fixes the Ruby Windows installer https://github.com/oneclick/rubyinstaller/issues/261
cd D:\home\site\deployments\tools\rails-on-azure
call gem --version
call gem install --local rubygems-update-2.2.3.gem --no-ri --no-rdoc
call update_rubygems --no-ri --no-rdoc > updaterubygems.log
ECHO What's our new Rubygems version?
call gem --version
call gem uninstall rubygems-update -x

popd

:end
