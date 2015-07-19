# rails-on-azure
For the first time, deploying Your rails project to Azure Websites (Web apps) have never been simplier.
Just add azure-deploy folder and .deployment file to Your project

For now rails-on-azure supports only:
- ruby@2.1.5
- DevKit@4.7.2
- rubygems@2.2.3

# Installation
## copy files into root of Your project:
 - .deployment
 - rails-on-azure.cmd

## modify main script file
 if You do have rails subdir in Your git repo for rails project files You should change code in rails-on-azure.cmd
 REM is a comment starting

    REM SET DEPLOYMENT_SOURCE=%DEPLOYMENT_SOURCE%\rails

 to

    SET DEPLOYMENT_SOURCE=%DEPLOYMENT_SOURCE%\rails


# rails-on-azure files

 https://files.ipepe.pl/railsonazure/rails-on-azure_ruby-and-devkit_0-0-1.7z

 https://files.ipepe.pl/railsonazure/rails-on-azure_deploy_0-0-1.7z

# Links related to topic

 http://www.hanselman.com/blog/RunningTheRubyMiddlemanStaticSiteGeneratorOnMicrosoftAzure.aspx

 http://www.hanselman.com/blog/AnnouncingRunningRubyOnRailsOnIIS8OrAnythingElseReallyWithTheNewHttpPlatformHandler.aspx
