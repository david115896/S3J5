#view
require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)
require 'app/gossip'
require 'app/controller'


class View
	attr_accessor

	def initialize

	end

	def create_gossip
		puts "Quel est votre nom ?"
		print ">> "
		new_author = gets.chomp
	       	while new_author ==""
	                new_author = gets.chomp
		end
		puts "Quel est votre potin ?"
		print ">> "
                new_content = gets.chomp
                while new_content ==""
                        new_author = gets.chomp
                end
		return {author: new_author, content: new_content}

	end

	def view_all(params_array)
		puts ""
		params_array.each do |gossip|
			print gossip.index
			print " | "
			print gossip.author
			print " : "
			puts gossip.content
			puts "-"*10
		end
		puts ""


	end


end


