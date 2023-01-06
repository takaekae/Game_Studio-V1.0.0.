Gem::Specification.new do |s|
    s.name           ="Studio"
    s.version        = "1.0.0"
    s.author         = "John Lloyd de Sape"
    s.email          = "johnlloyddesape@gmail.com"
    s.summary        = "Hunting Treasure"
    # s.description    = File.read(File.join(File.dirname(__FILE__), 'README'))
    # s.homepage      = ""

    # s.files          = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
    # s.test_files     = Dir["spec/**/*"]
    s.executables    = ['studio_game']

    s.required_ruby_version = '>=1.9'
    s.add_development_dependency 'rspec'
end
