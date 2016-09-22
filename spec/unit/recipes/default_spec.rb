require 'spec_helper'

describe 'chef-spike-crontab-crond-debian::default' do
    context 'When all attributes are default, on an unspecified platform' do
        let(:chef_run) do
            runner = ChefSpec::ServerRunner.new(platform: 'debian', version: '8.4')
            runner.converge(described_recipe)
        end

        it 'converges successfully' do
            expect { chef_run }.to_not raise_error
        end

        it 'must create ping file' do
            expect(chef_run).to create_file('/tmp/ping').with(
                content: 'pong'
            )
        end
    end
end
