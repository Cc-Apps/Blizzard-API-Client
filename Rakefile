require "rspec/core/rake_task"

namespace :spec do
  RSpec::Core::RakeTask.new(:unit) do |task|
    task.pattern = 'spec/unit/**/*_spec.rb'
  end
end

task default: 'spec:unit'