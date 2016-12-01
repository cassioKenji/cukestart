require 'thor'
require 'cukestart/generator/structure'

module Cukestart
  class Cli < Thor

    desc "project <project_name>", "Create your project"
    method_option :front, :desc => "If it will be a front test project", :type => :boolean, :aliases => "f"
    method_option :page_object, :desc => "Will use page_object", :type => :boolean, :aliases => "p"

    def project(project_name)
      Cukestart::Generator::Structure.start([project_name, options[:front], options[:page_object]])
    end

    desc "version", "Show Cukestart gem version"
    map %w(-v --version) => :version
    def version
      puts "Cukestart #{File.read(File.expand_path('../version', __FILE__))}"
    end
  end
end
