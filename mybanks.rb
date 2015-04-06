class People
	def initialize(nombre, apellido, numero_de_cuenta, tipo_de_cuenta, nombre_del_banco, monto)
		@@nombre = nombre
		@@apellido = apellido
		@@numero_de_cuenta = numero_de_cuenta
		@@tipo_de_cuenta = tipo_de_cuenta
		@@nombre_del_banco = nombre_del_banco
		@@monto = monto
	end
end

class Account < People
	
	def initialize(cuenta_origen, cuenta_destino, monto_transferencia)
		@cuenta_destino = cuenta_destino
		@cuenta_origen = cuenta_origen
		@monto_transferencia = monto_transferencia
	end

	def consultar_estado
		puts "Este es su saldo actual: #{@@monto}$"
	end

	def tranferencia_misma_cuenta
		if @cuenta_origen.length == 20 && @cuenta_destino.length == 20 && @@numero_de_cuenta.length == 20
			if @cuenta_origen == @cuenta_destino 
				monto_actual = @@monto + @monto_transferencia
				puts "Te has tranferido a ti mismo $#{@monto_transferencia}, este es ahora tu monto actual: #{monto_actual}$"
			else
				puts "La cuenta de origen, y la cuenta cuenta destino no coinciden"
			end
		else
			puts "Numero de cuenta invalida"
		end
	end

def transferencia_cuenta_origen
	if @cuenta_origen.length == 20 && @cuenta_destino.length == 20 && @@numero_de_cuenta.length == 20 && @cuenta_origen == @@numero_de_cuenta && @@monto >= @monto_transferencia && @@nombre_del_banco == "MyBank"
		monto1 = @@monto - @monto_transferencia
		puts "Transferecia exitosa señor #{@@nombre} #{@@apellido}, este es su monto actual: #{monto1}$"
	else
		@mensaje_error = "Error"
		puts @mensaje_error
	end
end

def transferencia_cuenta_destino
	if @cuenta_origen.length == 20 && @cuenta_destino.length == 20 && @@numero_de_cuenta.length == 20 && @mensaje_error != "Error" && @@nombre_del_banco != "MyBank"
		if @cuenta_destino == @@numero_de_cuenta
			monto = @monto_transferencia + @@monto
			puts "Señor #{@@nombre} #{@@apellido}, su saldo actual es: #{monto}$"
		else
			puts "Numero de cuenta invalida"
		end
	else
		puts "Transferecia Rechazada"
	end 
end
end

def main
	mybank = Account.new("00522314567865467456","00593426856342390056",2)

	person = People.new("John", "Galindez", "00522314567865467456", "Ahorro", "MyBank", 5)
	mybank.transferencia_cuenta_origen

	person2 = People.new("Juan", "Galindez","00593426856342390056", "Corriente", "Banesco", 1)
	mybank.transferencia_cuenta_destino

	person3 = People.new("carlos", "Galindez","00593426856342390057", "Ahorro", "MyBank",  16)
	mybank.consultar_estado
end
main