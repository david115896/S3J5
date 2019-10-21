#My ruby file router
require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)

require 'app/controller'


class Router
	attr_accessor :controller_instance
	
	def initialize
		@controller_instance = Controller.new
	end
	

	def perform
		system ("clear")
		puts "Bienvenue dans The Gossip Project"
		while true
			#on affiche le menu
			puts "Tu veux faire quoi jeune mouss' ?"
			puts "1. Je veux créer un gossip"
			puts "2. Je veux voir tous les gossips"
			puts "3. Je veux supprimer un gossip"
			puts "4. Je veux quitter l'app"
			params = gets.chomp.to_i #on attend le choix de l'utilisateur
			system("clear")
			case params #en fonction du choix
			      	when 1
			        	puts "Tu as choisi de créer un gossip" 
				        @controller_instance.create_gossip
				when 2
					puts "Tu veux voir tous les gossip"
					@controller_instance.view_gossip
				when 3
					puts "Tu veux supprimer un gossip"
					@controller_instance.delete_gossip
			      	when 4
				        puts "À bientôt !"
				      	break #Ce "break" permet de sortir de la boucle while. C'est même la seule façon d'en sortir.

			      	else
					puts "Ce choix n'existe pas, merci de ressayer" #Si l'utilisateur saisit une entrée non prévue, il retourne au début du "while true". 
			        	#C'est pour ça que la boucle est infinie: potentiellement, il peut se gourer jusqu'à la fin des temps :)

			end
			#system("clear")
		end	
	end

end
