REM Put Ruby in Path
SET PATH=%PATH%;D:\home\site\deployments\tools\rails-on-azure\ruby\bin

cd D:\home\site\wwwroot
call rails server --port %http_platform_port% --binding 127.0.0.1
