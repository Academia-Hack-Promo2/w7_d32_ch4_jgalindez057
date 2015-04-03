class Persona
	def initialize
	@@persona1 = {"cedula" => 10487745, "nombre" => "Juan", "apellido" => "Galindez", "tipoCuenta" => 'Ahorro', "nombre_banco" => 'banesco', "numeroDeCuenta" => '00547656894534789456', "monto_actual" => 0}
	@@persona2 = {"cedula" => 24843057, "nombre" => "John", "apellido" => "Requena", "tipoCuenta" => 'Corriente', "nombre_banco" => 'mercantil', "numeroDeCuenta" => '005823412367965467834567', "monto_actual" => 2}
	end

	def info
	puts "Ingrese su nombre y apellido por favor"
	ingreso = gets.chomp
	if ingreso == "Juan Galindez" || ingreso == "John Requena"
		puts "Bienvenido a mybank"
		puts "Desea hacer una transferencia? o Verificar su cuenta? (transferencia/Verificar)"
		desicion = gets.chomp

		if desicion == "t"
		 	puts "Ok cuentame, te vas a tranferir a ti o a otra persona? (m/o)"
		 		des = gets.chomp
		 		puts "Ingresa el numero de cuenta"
		 		num = gets.chomp

		 		if ingreso == 'Juan Galindez' && des == "o" && num == @@persona2['numeroDeCuenta']
		 				puts "Ingresa el monto a transferir"
		 				monto = gets.chomp
		 			if monto.to_i > @@persona1['monto_actual']
		 				puts "Transferencia Rechazada, saldo insuficiente"
		 			else
		 				montoactual = @@persona1['monto_actual'] - monto.to_i
		 				montoactual_2 = @@persona2['monto_actual'] + monto.to_i
		 				puts "¡Tranferencia Exitosa! Este es ahora su monto actual: #{montoactual}"
					
						puts "La transferencia al señor: #{@@persona2['nombre']} #{@@persona2['apellido']} Fue Exitosa, su monto actual es: #{montoactual_2}"
		 			end
								 			
					elsif ingreso == 'John Requena' && des == "o" && num == @@persona1['numeroDeCuenta']
						puts "Ingresa el monto a transferir"
		 				monto = gets.chomp
		 			if monto.to_i > @@persona2['monto_actual']
		 				puts "Transferencia Rechazada, saldo insuficiente"
		 			else
		 				montoactual = @@persona2['monto_actual'] - monto.to_i
		 				montoactual_2 = @@persona1['monto_actual'] + monto.to_i
		 				puts "¡Tranferencia Exitosa! Este es ahora su monto actual: #{montoactual}"
						puts "La transferencia al señor: #{@@persona1['nombre']} #{@@persona1['apellido']} Fue Exitosa, su monto actual es: #{montoactual_2}"
					end

					elsif ingreso == 'Juan Galindez' && des == "m" && num == @@persona1['numeroDeCuenta']
		 			puts "Ingresa el monto a transferir"
		 			monto_1 = gets.chomp
		 			montoactual_1 = @@persona1['monto_actual'] + monto_1.to_i
		 			puts "¡Transferencia Exitosa! Este es ahora su monto actual: #{montoactual_1}"

		 			elsif ingreso == 'John Requena' && des == "m" && num == @@persona2['numeroDeCuenta']
		 			puts "Ingresa el monto a transferir"
		 			monto_1 = gets.chomp
		 			montoactual_1 = @@persona2['monto_actual'] + monto_1.to_i
		 			puts "¡Transferencia Exitosa! Este es ahora su monto actual: #{montoactual_1}"

				else
					puts "Hubo un error en los datos!"
				end

		 elsif desicion == "v"
		 	puts "Ingresa tu numero de cuenta"
		 	num = gets.chomp
		 	if ingreso == 'Juan Galindez' && num == @@persona1['numeroDeCuenta']
		 		puts "Este es su estado actual: #{@@persona1['monto_actual']}"
		 	elsif ingreso == 'John Requena' && num == @@persona2['numeroDeCuenta']
		 		puts "Este es su estado actual: #{@@persona2['monto_actual']}"
		 	else
		 		puts "Numero de cuenta invalida"
		 	end
		 else
		 	puts "Lo sentimos, Intente de nuevo"
		 end
		else
		puts "Lo sentimos, usted no posee cuenta en este banco."
	end 
	 end
end

def main
	persona = Persona.new
	puts persona.info
end
main