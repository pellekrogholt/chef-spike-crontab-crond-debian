# foobar user/group

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

# foobar2 user/group

user 'foobar2' do
    action :remove
end

group 'foobar2' do
    action :remove
end

directory '/var/log/crontabfoobar2' do
    recursive true
    action :delete
end

cron 'user-foobar2-cron-tab' do
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

directory '/var/log/crontabdps' do
    recursive true
    action :delete
end

cron 'user-dps-cron-tab' do
    action :delete
end
