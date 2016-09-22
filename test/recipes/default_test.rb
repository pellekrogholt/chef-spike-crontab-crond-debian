# # encoding: utf-8

# Inspec test for recipe chef-spike-crontab-crond-debian::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

unless os.windows?
    describe user('root') do
        it { should exist }
        skip 'This is an example test, replace with your own test.'
    end
end

describe port(80) do
    it { should_not be_listening }
    skip 'This is an example test, replace with your own test.'
end

describe file('/tmp/ping') do
    it { should exist }
    its('content') { should match(/^pong/) }
end
