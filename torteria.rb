		$pan = 60
		$aguacate = 30
		$mayonesa = 30

class Torta

	@@numero_tortas = 0

	def initialize(extras)
		@pan = 2
		@aguacate = 1
		@mayonesa = 1
		@@numero_tortas += 1

		"Torta numero: #{@@numero_tortas}" 
		p Torta.bodega
		
	end

	def self.bodega

		$pan -= 2
		$aguacate -= 1
		$mayonesa -= 1

		"Quedan en bodega pan-> #{$pan}, aguacate-> #{$aguacate}, mayonesa-> #{$mayonesa}"
	end


end

class TortaPastor < Torta

	def initialize(extras)
		"Torta de Pastor"
		@extras = extras
		@time = 8
		super
	end
end

class TortaRusa < Torta

	def initialize(extras)
		"Torta Rusa"
		@extras = extras
		@time = 6
		super
	end
end

class TortaSuiza < Torta

	def initialize(extras)
		"Torta Suiza"
		@extras = extras
		@time = 4
		super
	end
end

class TortaHawaiana < Torta

	def initialize(extras)
		"Torta Hawaiana"
		@extras = extras
		@time = 4
		super
	end
end

class Cocina 

	@@tortas = 0
	@@bandeja = []


	def initialize
		"Nuevo pedido"
	end

	def pedido

		return "Ya no quedan ingredientes para crear mas tortas" if $pan < 1 || $aguacate < 1 || $mayonesa < 1

		@@tortas = 0
		@@bandeja = []
		menu = ["Pastor", "Rusa", "Suiza", "Hawaiana"]
		max_horno = rand(1..4)

		for i in 1..max_horno

			r = rand(0..3)

			if menu[r] == "Pastor"
				@@bandeja << TortaPastor.new(["pastor", "queso", "pina"])
				@@tortas += 1
			end

			if menu[r] == "Rusa"
				@@bandeja << TortaRusa.new(["pierna", "queso", "jamon"])
				@@tortas += 1
			end

			if menu[r] == "Suiza"
				@@bandeja << TortaRusa.new(["pierna", "queso", "jamon"])
				@@tortas += 1
			end

			if menu[r] == "Hawaiana"
				@@bandeja << TortaHawaiana.new(["jamon", "queso", "pina"])
				@@tortas += 1
			end

			return "Ya no quedan ingredientes para crear mas tortas" if $pan < 1 || $aguacate < 1 || $mayonesa < 1
		end

		p "El numero de tortas en el pedido es de #{@@tortas} y son: #{@@bandeja}" 
		puts
	end

	def horno
		p "Ingresa en el horno #{@@bandeja}"
		puts
		haw = []
		pas = []
		rus = []
		sui = []
		tortas_listas = []

		@@bandeja.each do |torta|
			if torta.to_s.include?("Pastor")
				pas << torta.to_s
			elsif torta.to_s.include?("Hawaiana")
				haw << torta.to_s
			elsif torta.to_s.include?("Rusa")
				rus << torta.to_s
			elsif torta.to_s.include?("Suiza")
				sui << torta.to_s	
			end
		end

		if pas.length > 0
			# time_cooked = 8
			time_cooked = 0
			while time_cooked < 8
				time_cooked += 1
				p "cocinando tortas de pastor tiene #{time_cooked} minutos en el horno"
			end
			
			if time_cooked == 8
				p "Tortas Listas #{pas}"
				puts
			end
		end

		if haw.length > 0
			# time_cooked = 4
			time_cooked = 0
			while time_cooked < 4
				time_cooked += 1
				p "cocinando tortas hawainas tiene #{time_cooked} minutos en el horno"
			end
			
			if time_cooked == 4
				p "Tortas Listas #{haw}"
				puts
			end
		end

		if rus.length > 0
			# time_cooked = 6
			time_cooked = 0
			while time_cooked < 6
				time_cooked += 1
				p "cocinando tortas rusas tiene #{time_cooked} minutos en el horno"
			end
			
			if time_cooked == 6
				p "Tortas Listas #{rus}"
				puts
			end
		end

		if sui.length > 0
			# time_cooked = 4
			time_cooked = 0
			while time_cooked < 4
				time_cooked += 1
				p "cocinando tortas suizas tiene #{time_cooked} minutos en el horno"
			end
			
			if time_cooked == 4
				p "Tortas Listas #{sui}"
				puts
			end
		end
	
	end


end # Final Clase Cocina


p cocinero = Cocina.new
puts "----------------------------------------- Pedido ---------------------------------------------------------------"

p cocinero.pedido

puts "-------------------------------------- Entrada al horno -------------------------------------------------------"

p cocinero.horno






# [[TortaPastor.new(["pastor", "queso", "pina"])],
# [TortaRusa.new(["pierna", "queso", "jamon"])],
# [TortaSuiza.new(["queso_blanco", "queso", "amarillo"])],
# [TortaHawaiana.new(["jamon", "queso", "pina"])]]

