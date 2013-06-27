source 'https://rubygems.org'
gemspec

File.open('spec/test_app/Gemfile') do |f|
  f.readlines.each do |line|
    if line.match(/^gem\s/) && !line.match(/'arum'/)
      eval line
    end
  end
end

gem 'arum', path: '.'
