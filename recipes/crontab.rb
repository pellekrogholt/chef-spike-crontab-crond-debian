package 'cron' do
    action :install
end

service 'cron' do
    action [:start, :enable]
end

# foobar crontab

group 'foobar' do
    action :create
end

user 'foobar' do
    comment 'User running a crontab'
    gid 'foobar'
    action :create
end

directory '/var/log/crontabfoobar' do
    owner 'foobar'
    group 'foobar'
    mode '0755'
    action :create
end

cron 'user-foobar-cron-tab' do
    minute '*'
    hour '*'
    command 'echo ping >> /var/log/crontabfoobar/foobar.log'
    user 'foobar'
end

# root crontab

directory '/var/log/crontabroot' do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end

cron 'user-root-cron-tab' do
    minute '*'
    hour '*'
    command 'echo ping >> /var/log/crontabroot/root.log'
    user 'root'
end

# dps crontab (user is already there)

cron 'user-dps-cron-tab' do
    minute '*'
    hour '*'
    command 'echo ping >> /var/log/crontabdps/dps.log'
    user 'dps'
end
