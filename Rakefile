# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/rails_config_model.rb'


class Hoe
  def extra_deps
    @extra_deps.reject do |x|
      Array(x).first == 'hoe'
    end
  end
end

Hoe.new('rails_config_model_generator', RailsConfigModel::VERSION) do |p|
  p.rubyforge_name = 'rconfig'
  p.name = "rails_config_model_generator"
  p.author = ["Brian Hogan"]
  #p.remote_rdoc_dir = ''
  # p.summary = 'FIX'
  p.readme_file= "README.rdoc"
  p.extra_rdoc_files = FileList['*.rdoc']
  p.description = p.paragraphs_of('README.txt', 2..10).join("\n\n")
  p.url = "http://rconfig.rubyforge.org/"
  p.changes = p.paragraphs_of('History.txt', 0..1).join("\n\n")
  p.remote_rdoc_dir = ""
end

# vim: syntax=Ruby
