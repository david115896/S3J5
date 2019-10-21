#My ruby file app
require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)
require 'app/controller'
require 'app/gossip'
require 'app/router'


Router.new.perform
