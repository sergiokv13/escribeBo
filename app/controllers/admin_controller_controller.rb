class AdminControllerController < ApplicationController

	def newUser
		@roles = [['Demolay', 'Demolay'], ['No Demolay', 'No Demolay']]
		@campaments = Campament.all
		@chapters = Chapter.where(:chapter_type =>"Capitulo").all
		@seguro = [['Asegurado con nosotros','1'],['Asegurado con terceros','0']]
		@estados = [['Casado','Casado'],['Soltero','Soltero'],['Viudo','Viudo']]
		@father = [['Mason','Mason'],['No Mason','No Mason']]
	end

	def update_chapters
	  @chapters = Chapter.where(:campament_id => params[:campament], :chapter_type =>"Capitulo")
	  render :partial => "chapters", :object => @chapters
	end

	def createUser
		@user = User.new
		@user.email = params[:email]
		@user.name = params[:name]
		@user.lastname = params[:lastname]
		@user.role = params[:role]
		@user.demolayID = params[:democlayID]
		@user.ci = params[:ci]
		@user.chapter_id = params[:chapter_id]
		@user.campament_id = params[:campament]
		@user.password = params[:ci]
		@user.password_confirmation = params[:ci]

		@user.birth_date = params[:birth_date]
		@user.city = params[:city]
		@user.adress = params[:adress]
		@user.phone = params[:phone]
		@user.cellphone = params[:cellphone]

		@user.assurance = params[:assurance]
		@user.godfather_id = params[:godfather_id]
		@user.iniciacion = params[:iniciacion]
		@user.father_name = params[:father_name]
		@user.father_info = params[:father_info]
		@user.father_adress = params[:father_adress]
		@user.father_mail = params[:father_mail]
		@user.mather_name = params[:mather_name]
		@user.mather_adress = params[:mather_adress]
		@user.mather_mail = params[:mather_mail]

		@user.estado_civil = params[:estado_civil]
		@user.nombre_esposa = params[:nombre_esposa]
		@user.taller_nombre = params[:taller_nombre]
		@user.taller_numero = params[:taller_numero]

		@user.president_aproved= false
		@user.deputy_aproved = false
		@user.oficial_aproved = false
		@user.registration_form = params[:registration_form]

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
		if current_user.is_president
			@users_to_approve = User.where(president_aproved: [false, nil])
			@degrees_to_approve = Degree.for_president
		end
		if current_user.is_deputy
			@users_to_approve = User.where(deputy_aproved: [false, nil], president_aproved: true)
			@degrees_to_approve = Degree.for_deputy
		end
		if current_user.is_oficial
			@users_to_approve = User.where(oficial_aproved: [false, nil], deputy_aproved: true, president_aproved: true)
			@degrees_to_approve = Degree.for_oficial
		end
	end

	def approve
		@user = User.find(params[:id])
		if current_user.is_president
			@user.aprove_president
		end
		if current_user.is_deputy
			@user.aprove_deputy
		end
		if current_user.is_oficial
			@user.aprove_oficial
		end
		redirect_to '/approvals'
	end

	def approve_degree
		@degree = Degree.find(params[:id])
		if current_user.is_president
			@degree.aprove_president
		end
		if current_user.is_deputy
			@degree.aprove_deputy
		end
		if current_user.is_oficial
			@degree.aprove_oficial
		end
		redirect_to '/approvals'
	end

end
