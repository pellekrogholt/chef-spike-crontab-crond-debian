# Encoding: utf-8
require 'bundler/setup'

namespace :style do
    require 'rubocop/rake_task'
    desc 'Run Ruby style checks'
    RuboCop::RakeTask.new(:ruby)

    require 'foodcritic'
    desc 'Run Chef style checks'
    FoodCritic::Rake::LintTask.new(:foodcritic) do |t|
        t.options = {
            fail_tags: ['any']
        }
    end
end

desc 'Run all style checks'
task style: ['style:foodcritic', 'style:ruby']

require 'rspec/core/rake_task'
desc 'Run ChefSpec unit tests'
RSpec::Core::RakeTask.new(:spec) do |t, _args|
    t.rspec_opts = 'spec/unit'
end

require 'kitchen'
desc 'Run integration tests'
task :integration do
    begin
        ec = system('kitchen destroy')
        raise "kitchen destroy failed, exit code: #{ec}" unless ec

        ec = system('kitchen converge default-debian-84')
        raise "Converging default-debian-84 failed, exit code: #{ec}" unless ec
        ec = system('kitchen verify default-debian-84')
        raise "Verifying default-debian-84 failed, exit code: #{ec}" unless ec
    ensure
        system('kitchen destroy')
    end
end

task default: %w(style spec integration)
