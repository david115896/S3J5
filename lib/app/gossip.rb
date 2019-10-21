require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)

require 'app/controller'


class Gossip

	attr_accessor :author, :content, :index
	def initialize(params)
		@author = params[:author]
		@content = params[:content]
		@index = params[:index]
	end

	def save
		if File.exist?('db/gossip.csv') == false
			CSV.open('db/gossip.csv', 'a') do |csv|
                        csv << ["Authors", "Contents"]  
	  		end
		end
		CSV.open('db/gossip.csv', 'a') do |csv|
        		csv << [@author, @content]
      		end
  	end
	
	def self.delete(index)

		file = CSV.read('db/gossip.csv', headers: true, header_converters: :symbol, converters: :all) 
		file.delete(index)   #supprime une ligne du tabeau par son index
		#file.delete(:authors)	#supprime une colonne du tableau par son titre
		#file.delete_if do |row| #supprime chaque ou l'auteur se nomme David
		#	row[:authors] =="David"
		#end 
		CSV.open('db/gossip.csv', 'w') do |csv|
                        csv << ["Authors", "Contents"]
			file.each do |row|
				csv.puts row
			end
		end
	
	end
	

	def self.all
		all_gossips = Array.new
		if File.exist?('db/gossip.csv') == true

		file = CSV.read('db/gossip.csv', headers: true, header_converters: :symbol, converters: :all)
		file.each_with_index do |row,i|
			#puts row, i
			params = {index: i, author: row[:authors], content: row[:contents]}
			all_gossips <<  Gossip.new(params)			
		end
		
		else
		
			puts "le fichier n'existe pas! Commence par ecrire un potin"
		end	

		return all_gossips


		#headers: true # Removes headers from read
		#header_converters: :symbol # Allows each header to be accessed by their respective symbol
		#converters: :all # Converts each datatype to the correct ruby datatype ex: string representations of integers get converted into intege
	end



end
