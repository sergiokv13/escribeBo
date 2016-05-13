class AdminControllerController < ApplicationController

	def newUser
		@paraOficialEjecutivo = [['Oficial Ejecutivo', 'Oficial Ejecutivo'], ['Diputado', 'Diputado'], ['Delegado Regional', 'Delegado Regional'], ['Presidente Consejo Consultivo', 'Presidente Consejo Consultivo'], ['Consultor', 'Consultor'],['Demolay', 'Demolay']]
		@paraDiputado = [['Delegado Regional', 'Delegado Regional'], ['Presidente Consejo Consultivo', 'Presidente Consejo Consultivo'], ['Consultor', 'Consultor'],['Demolay', 'Demolay']]
		@paraDelegadoRegional = [['Presidente Consejo Consultivo', 'Presidente Consejo Consultivo'], ['Consultor', 'Consultor'],['Demolay', 'Demolay']]
		@paraPresidenteConsejoConsultivo = [['Consultor', 'Consultor'],['Demolay', 'Demolay']]
		@paraConsultor = [['Demolay', 'Demolay']]
		@paraMaestroConsejero = [['Demolay', 'Demolay']]
	end

	def createUser
		@user = User.new
		@user.email = params[:email]
		@user.name = params[:name]
		@user.lastname = params[:lastname]
		@user.role = params[:role]
		@user.demolayID = params[:demolayID]
		@user.ci = params[:ci]
		@user.chapter_id = params[:chapter_id]
		@user.password = params[:ci]
		@user.password_confirmation = params[:ci]
		if @user.save
			flash[:notice] = "El usuario fue creado correctamente."
			redirect_to "/"
		else
			flash[:notice] = "El usuario no fue creado."
			redirect_to (:back)
		end
	end

	def users
		@users = User.all
	end

	def search
		search = params[:search]
		@users = User.where("name LIKE ?","%#{search}%")
		@entes = Chapter.where("chapter_name LIKE ?","%#{search}%")
	end

end
