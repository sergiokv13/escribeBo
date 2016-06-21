class AdminControllerController < ApplicationController

	def newUser
		@user = User.new
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
		@user = User.new(user_params)
		@user.password = @user.ci
		@user.password_confirmation = @user.ci
		@user.president_aproved= false
		@user.deputy_aproved = false
		@user.oficial_aproved = false

		if @user.save
			flash[:notice] = "El usuario fue creado correctamente."
			redirect_to '/users'
		else
			flash[:notice] = "El usuario no fue creado."
			@roles = [['Demolay', 'Demolay'], ['No Demolay', 'No Demolay']]
			@campaments = Campament.all
			@chapters = Chapter.where(:chapter_type =>"Capitulo").all
			@seguro = [['Asegurado con nosotros','1'],['Asegurado con terceros','0']]
			@estados = [['Casado','Casado'],['Soltero','Soltero'],['Viudo','Viudo']]
			@father = [['Mason','Mason'],['No Mason','No Mason']]
			render :newUser
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

	def chapter_aprovals
		@announcements_to_aprove = current_user.announcements_to_aprove
	end

	def aprove_publication
		publication = Announcement.find(params[:id])
		if publication.aprove(current_user) != nil
			redirect_to :back
		else
			redirect_to :back
		end
	end

	def user_params
    params.require(:user).permit(:email, :name, :lastname, :role, :demolayID, :ci, :chapter_id, :campament_id, :birth_date, :city, :adress, :phone, :cellphone, :assurance, :godfather_id, :iniciacion, :father_name, :father_info, :father_adress, :father_mail, :mather_name, :mather_adress, :mather_mail, :estado_civil, :nombre_esposa, :taller_nombre, :taller_numero, :registration_form)
  end

end
