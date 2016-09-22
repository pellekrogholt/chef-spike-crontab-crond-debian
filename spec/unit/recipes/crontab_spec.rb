require 'spec_helper'

describe 'chef-spike-crontab-crond-debian::crontab' do
    context 'When all attributes are default, on an unspecified platform' do
        let(:chef_run) do
            runner = ChefSpec::ServerRunner.new(platform: 'debian', version: '8.4')
            runner.converge(described_recipe)
        end

        it 'converges successfully' do
            expect { chef_run }.to_not raise_error
        end

        it 'must create crontab for the foobar user' do
            expect(chef_run).to create_cron('user-foobar-cron-tab').with(
                minute: '*',
                hour: '*',
                command: 'echo ping >> /var/log/crontabfoobar/foobar.log',
                user: 'foobar'
            )
        end

        it 'must create crontab for the root user' do
            expect(chef_run).to create_cron('user-root-cron-tab').with(
                minute: '*',
                hour: '*',
                command: 'echo ping >> /var/log/crontabroot/root.log',
                user: 'root'
            )
        end
    end
end
