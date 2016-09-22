require 'spec_helper'

describe 'chef-spike-crontab-crond-debian::crontab_cleanup' do
    context 'When all attributes are default, on an unspecified platform' do
        let(:chef_run) do
            runner = ChefSpec::ServerRunner.new(platform: 'debian', version: '8.4')
            runner.converge(described_recipe)
        end

        it 'converges successfully' do
            expect { chef_run }.to_not raise_error
        end

        it 'must remove crontab for the foobar user' do
            expect(chef_run).to delete_cron('user-foobar-cron-tab')
        end

        it 'must remove crontab for the root user' do
            expect(chef_run).to delete_cron('user-root-cron-tab')
        end
    end
end
