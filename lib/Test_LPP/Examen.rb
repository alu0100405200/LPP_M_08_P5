 
 require_relative "ListaEnlazada"
 require_relative "Preguntas"

class Exam
	
	def initialize( lis )
		raise ArgumentError, 'No es una lista' unless lis.is_a? Lista
		puts "Introduzca su nombre:"
		STDOUT.flush
		@nombre = gets.chomp
		puts "Introduzca su apellido:"
		STDOUT.flush
		@apellido = gets.chomp
		@wrong = 0
		@right = 0
		@total = 0
		@eleccion
		
	end

	def nombre
		 @nombre
	end
	
	def apellido
		 @apellido
	end 

	def correcta
		 @right
	end 

	def incorrecta
		@wrong
	end

	def crear_examen( lis )
		puts "Examen de LPP "
		puts "Apellidos: #{@apellido}"
		puts "Nombre: #{@nombre}\n"
		puts "------------------------------------------------\n"
		
		while lis.head != nil
			lis.head.to_s
			STDOUT.flush
			@eleccion = gets.chomp
			
			if( lis.head.responder(@eleccion) == true)
				@right += 1
			else
				@wrong += 1
			end
		@total += 1
		lis.pop
		end

	end 



end


        p1 = Pregunta.new("1.-) Cual es la salida del siguiente codigo Ruby?\n\tclass Xyx\n\t def pots\n\t @nice\n\t end\n\tend\n\nxyz = Xyz.new\np xyz.pots",["#<Xyz:0xa00208>","nil","0","Ninguna de las anteriores"],4,2)
        p2 = TrueFalse.new("2.-) La siguiente definicion de un hash en Ruby es valida:\n\thash_raro = {\n\t [1,2,3] => Oject.new(),\n\t Hash.new => :toto\n}",true)
        p3 = Pregunta.new("3.-) Cual es la salida del siguiente codigo Ruby?\n\tclass Array\n\t def say_hi\n\t \"HEY!\"\n\t end\n\tend\n\np [1, \"bob\"].say_hi",["1","bob","HEY!","Ninguna de las anteriores"],4,3)
        p4 = Pregunta.new("4.-) Cual es el tipo del objeto en el siguiente codigo Ruby?\n\tclass Objeto\n\tend",["Una instancia de la clase Class","Una constante","Un objeto","Ninguna de las anteriores"],4,1)
        p5 = TrueFalse.new("5.-) Es apropiado que una clase Tablero herede de una clase Juego",false)
        ary = [p1,p2,p3,p4,p5]
        list = Lista.from_array(ary)

	examen = Exam.new(list)
	
	examen.crear_examen(list)