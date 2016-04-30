class AdminControllerController < ApplicationController

	def newUser
		@paraOficialEjecutivo = [['Oficial Ejecutivo', 'Oficial Ejecutivo'], ['Diputado', 'Diputado'], ['Delegado Regional', 'Delegado Regional'], ['Presidente Consejo Consultivo', 'Presidente Consejo Consultivo'], ['Consultor', 'Consultor'], ['Maestro Consejero', 'Maestro Consejero'],['Demolay', 'Demolay']]
		@paraDiputado = [['Delegado Regional', 'Delegado Regional'], ['Presidente Consejo Consultivo', 'Presidente Consejo Consultivo'], ['Consultor', 'Consultor'], ['Maestro Consejero', 'Maestro Consejero'],['Demolay', 'Demolay']]
		@paraDelegadoRegional = [['Presidente Consejo Consultivo', 'Presidente Consejo Consultivo'], ['Consultor', 'Consultor'], ['Maestro Consejero', 'Maestro Consejero'],['Demolay', 'Demolay']]
		@paraPresidenteConsejoConsultivo = [['Consultor', 'Consultor'], ['Maestro Consejero', 'Maestro Consejero'],['Demolay', 'Demolay']]
		@paraConsultor = [['Maestro Consejero', 'Maestro Consejero'],['Demolay', 'Demolay']]
		@paraMaestroConsejero = [['Demolay', 'Demolay']]
	end

	def createUser
		@user = User.new
		@user.email = params[:email]
		@user.name = params[:name]
		@user.lastname = params[:lastname]
		@user.role = params[:role]
		@user.role = params[:demolayID]
		@user.password = "12345678"
		@user.password_confirmation = "12345678"
		if @user.save
			flash[:notice] = "El usuario fue creado correctamente."
			redirect_to "/"
		else
			flash[:notice] = "El usuario no fue creado."
			redirect_to (:back)
		end
	end
end
