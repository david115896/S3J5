#My ruby file controller
require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)
require 'app/controller'
require 'app/gossip'
require 'app/router'
require 'views/view'


class Controller
	attr_accessor :gossip_instance, :view_instance

	def initialize
		@view_instance = View.new

	end

	def create_gossip
		params_hash = @view_instance.create_gossip
		@gossip_instance = Gossip.new(params_hash)
		@gossip_instance.save
	end

	def view_gossip
		params_array = Gossip.all
		@view_instance.view_all(params_array)
	
	end

	def delete_gossip
		params_array = Gossip.all
                @view_instance.view_all(params_array)
		puts "Quel potin souhaitez vous supprimer ?"
		index = gets.chomp.to_i
		Gossip.delete(index)
	end
	



end
