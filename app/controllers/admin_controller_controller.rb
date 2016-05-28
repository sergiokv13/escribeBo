class AdminControllerController < ApplicationController

	def newUser
		@paraOficialEjecutivo = [['Oficial Ejecutivo', 'Oficial Ejecutivo'], ['Diputado', 'Diputado'], ['Delegado Regional', 'Delegado Regional'], ['Presidente Consejo Consultivo', 'Presidente Consejo Consultivo'], ['Consultor', 'Consultor'],['Demolay', 'Demolay']]
		@paraDiputado = [['Delegado Regional', 'Delegado Regional'], ['Presidente Consejo Consultivo', 'Presidente Consejo Consultivo'], ['Consultor', 'Consultor'],['Demolay', 'Demolay']]
		@paraDelegadoRegional = [['Presidente Consejo Consultivo', 'Presidente Consejo Consultivo'], ['Consultor', 'Consultor'],['Demolay', 'Demolay']]
		@paraPresidenteConsejoConsultivo = [['Consultor', 'Consultor'],['Demolay', 'Demolay']]
		@paraConsultor = [['Demolay', 'Demolay']]
		@paraMaestroConsejero = [['Demolay', 'Demolay']]
		@campaments = [['Cochabamba','Cochabamba'],['La Paz','La Paz'],['Santa Cruz','Santa Cruz'],['Chuquisaca','Chuquisaca'],['Beni','Beni'],['Oruro','Oruro'],['Pando','Pando'],['Potosi','Potosi'],['Tarija','Tarija']]
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
		@user.president_aproved = false
		@user.deputy_aproved = false
		@user.oficial_aproved = false
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

	def approvals
		role = current_user.role
		if role == "Presidente Consejo Consultivo"
			@users_to_approve = User.where(president_aproved: [false, nil])
		end
		if role == "Delegado Regional"
			@users_to_approve = User.where(deputy_aproved: [false, nil], president_aproved: true)
		end
		if role == "Oficial Ejecutivo"
			@users_to_approve = User.where(oficial_aproved: [false, nil], deputy_aproved: true, president_aproved: true)
		end
	end

	def approve
		@user = User.find(params[:id])
		role = current_user.role
		if role == "Presidente Consejo Consultivo"
			@user.aprove_president
		end
		if role == "Delegado Regional"
			@user.aprove_deputy
		end
		if role == "Oficial Ejecutivo"
			@user.aprove_oficial
		end
		redirect_to '/approvals'
	end

end
