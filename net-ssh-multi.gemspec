# coding: utf-8

# version.rb requires net-ssh, which isn't installed yet when bundler first evaluates this file.
version_rb = File.read(File.expand_path('../lib/net/ssh/multi/version.rb', __FILE__))
version = %w[MAJOR MINOR TINY PRE].map { |part| version_rb[/^\s*#{part}\s*=\s*"?(\w+)"?/, 1] }
version = version.reject { |part| part.nil? || part == "nil" }.join(".")

Gem::Specification.new do |spec|
  spec.name          = "net-ssh-multi"
  spec.version       = version
  spec.authors       = ["Jamis Buck", "Delano Mandelbaum", "Mikl\u{f3}s Fazekas"]
  spec.email         = ["net-ssh@solutious.com"]

  if ENV['NET_SSH_BUILDGEM_SIGNED']
    spec.cert_chain    = ["net-ssh-public_cert.pem"]
    spec.signing_key   = "/mnt/gem/net-ssh-private_key.pem"
  end

  spec.summary       = %q{Control multiple Net::SSH connections via a single interface.}
  spec.description   = %q{Control multiple Net::SSH connections via a single interface.}
  spec.homepage      = "https://github.com/net-ssh/net-ssh-multi"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb"] + %w[CHANGES.txt LICENSE.txt README.rdoc]
  spec.extra_rdoc_files = %w[LICENSE.txt README.rdoc]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", ">= 12.0"
  spec.add_development_dependency "minitest", ">= 5.10"
  spec.add_development_dependency "mocha", ">= 1.4"

  spec.add_runtime_dependency "net-ssh", ">= 4.0.0"
  spec.add_runtime_dependency "net-ssh-gateway", ">= 1.2.0"
end
