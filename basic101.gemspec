# -*- encoding: utf-8 -*-
# frozen_string_literal: true

require File.join(File.dirname(__FILE__), "lib/basic101/release")

class Readme

  def description
    readme = File.open(README_PATH, "r", &:read)
    description = readme[/^# BASIC101.*\n+((?:.*\n)+?)\n*##/i, 1]
    unless description
      raise "Unable to extract description from readme"
    end
    description = remove_badges(description)
    description = remove_markdown_link(description)
    description = join_lines(description)
    description
  end

  private

  README_PATH = File.expand_path("README.md", File.dirname(__FILE__))
  private_constant :README_PATH
  
  def remove_markdown_link(description)
    regex = %r{
    \[
      ([^\]]+)
    \]
    (
      \[\d+\] |
      \([^)]+\)
    )
    }x
    description.gsub(regex, '\1')
  end

  def remove_badges(description)
    description.gsub(/^\[!.*\n/, "")
  end

  def join_lines(description)
    description.gsub(/\n/, " ").strip
  end

end

readme = Readme.new
Gem::Specification.new do |s|
  s.name = "basic101"
  s.version = Basic101::Release::VERSION
  s.required_rubygems_version = Gem::Requirement.new(">= 0")
  s.require_paths = ["lib"]
  s.authors = ["Wayne Conrad"]
  s.date = Basic101::Release::DATE
  s.description = readme.description
  s.email = "kf7qga@gmail.com"
  s.executables = ["basic101"]
  s.extra_rdoc_files = [
    "LICENSE.md",
    "README.md"
  ]
  s.files = [
    "Changelog.md",
    "Gemfile",
    "Gemfile.lock",
    "Rakefile",
    "VERSION",
    "basic101.gemspec",
  ]
  s.files += Dir["examples/**/*.rb"]
  s.files += Dir["lib/**/*.rb"]
  s.files += Dir["bin/*.rb"]
  s.files += Dir["test/integration/tests/basic_computer_games/*.bas"]
  s.homepage = "http://github.com/wconrad/basic101"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.6"
  s.summary = "Circa 1980 basic intepreter"
  s.add_runtime_dependency("parslet", "~> 1.8")
  s.add_development_dependency("rake", "~> 12.0")
  s.add_development_dependency("rspec", "~> 3.6")
  s.add_development_dependency("rspec-its", "~> 1.2")
  s.add_development_dependency("simplecov", "~> 0.14")
  s.add_development_dependency("redcarpet", "~> 3.2")
  s.add_development_dependency("yard", "~> 0.9.5")
end

