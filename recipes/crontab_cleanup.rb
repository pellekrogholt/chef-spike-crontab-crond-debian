# foobar crontab

user 'foobar' do
    action :remove
end

group 'foobar' do
    action :remove
end

directory '/var/log/crontabfoobar' do
    recursive true
    action :delete
end

cron 'user-foobar-cron-tab' do
    action :delete
end

# root crontab

directory '/var/log/crontabroot' do
    recursive true
    action :delete
end

cron 'user-root-cron-tab' do
    action :delete
end

# dps crontab

cron 'user-dps-cron-tab' do
    action :delete
end
