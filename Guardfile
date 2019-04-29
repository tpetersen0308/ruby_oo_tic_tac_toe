guard :rspec, cmd: "bundle exec rspec" do
  # watch /lib/ files
  watch(%r{^lib/(.+).rb$}) do |m|
    "spec/#{m[1]}_spec.rb"
  end

  watch(%r{^lib/tic_tac_toe/models/(.+).rb$}) do |m|
    "spec/#{m[1]}_spec.rb"
  end

  watch(%r{^lib/tic_tac_toe/models/concerns/(.+).rb$}) do |m|
    "spec/#{m[1]}_spec.rb"
  end
 
# watch /spec/ files
  watch(%r{^spec/(.+).rb$}) do |m|
    "spec/#{m[1]}.rb"
  end
end