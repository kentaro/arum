source 'https://rubygems.org'
gemspec

File.open('spec/test_app/Gemfile') do |f|
  line = f.read
  if line.match(/^gem\s/)
    eval line
  end
end
