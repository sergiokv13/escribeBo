class AdminControllerController < ApplicationController

	def newUser
		@user = User.new
		@roles = [['DeMolay', 'DeMolay'], ['No DeMolay', 'No DeMolay']]
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

	def update_chapters_for_filter
		campament = params[:campament_id].to_i
		if campament != 0
			@chapters = Chapter.where(:campament_id => campament).to_a
		else
			@chapters = Chapter.all.to_a
		end

		render :partial => "chapters2", :object => @chapters
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
			@roles = [['DeMolay', 'DeMolay'], ['No DeMolay', 'No DeMolay']]
			@campaments = Campament.all
			@chapters = Chapter.where(:chapter_type =>"Capitulo").all
			@seguro = [['Asegurado con nosotros','1'],['Asegurado con terceros','0']]
			@estados = [['Casado','Casado'],['Soltero','Soltero'],['Viudo','Viudo']]
			@father = [['Mason','Mason'],['No Mason','No Mason']]
			render :newUser
		end
	end

	def users
		@chapters = Chapter.all
		@users = Array.new
		if current_user.is_oficial
			@users = User.all
		end

		if current_user.is_deputy
			@charges = Charge.where(:user_id => current_user.id)
			@charges.each do |charge|
				if (charge.title == "Delegado Regional")
					@users_from_campament = User.where(:campament_id => charge.campament_id)
					@users_from_campament.each do |u|
						@users.push(u)
					end
				end
			end
		end

		if current_user.is_president
			@charges = Charge.where(:user_id => current_user.id)
			@charges.each do |charge|
				if (charge.title == "Presidente Consejo Consultivo")
					@users_from_campament = User.where(:chapter_id => charge.chapter_id)
					@users_from_campament.each do |u|
						@users.push(u)
					end
				end
			end
		end
		@users = @users.uniq{|x| x.id}
	end

	def search
		search = params[:search]
		@users = User.where("name LIKE ?","%#{search}%")
		@entes = Chapter.where("chapter_name LIKE ?","%#{search}%")
	end

	def approvals
		if current_user.is_president
			@users_to_approve = User.where(:president_aproved=>false)
			@degrees_to_approve = Degree.where(:president_aproved=>false)
		end
		if current_user.is_deputy
			@users_to_approve =  User.where(:deputy_aproved=>false)
			@degrees_to_approve = Degree.where(:deputy_aproved=>false)
		end
		if current_user.is_oficial
			@users_to_approve = User.all_to_be
			@degrees_to_approve = Degree.all_to_be
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
			@user.aprove_president
			@user.aprove_deputy
			@user.set_first_degree
		end
		redirect_to '/profile/' + @user.id.to_s
	end

	def reject
		@user = User.find(params[:id])
	end

	def update_reject
		@user = User.find(params[:id])
		@user.reject_note = params[:notas_de_rechazo]
		if current_user.is_deputy
			@user.president_aproved = false
		end
		if current_user.is_oficial
			@user.deputy_aproved = false
		end
		@user.save
		if current_user.is_president
			@user.delete
		end
		redirect_to ("/approvals")
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
			@degree.aprove_deputy
			@degree.aprove_president
		end
		redirect_to '/profile/' + @degree.user_id.to_s
	end

	def reject_degree
		@degree = Degree.find(params[:id])
		@user = User.find(@degree.user_id)
	end

	def update_reject_degree
		@degree = Degree.find(params[:id])
		@degree.reject_note = params[:notas_de_rechazo]
		if current_user.is_deputy
			@degree.president_aproved = false
		end
		if current_user.is_oficial
			@degree.deputy_aproved = false
		end
		@degree.save
		if current_user.is_president
			@degree.delete
		end
		redirect_to ("/approvals")
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

	def filtered
		campament = params[:campament_id].to_i
		chapter = params[:chapter_id].to_i
		filt = params[:f].to_i
		ord = params[:o].to_i
		flag1 = false
		flag2 = false
		puts filt
		puts ord


		if campament != 0
			flag1 = true
			@users = User.where(campament_id: campament).to_a
		end

		if chapter != 0
			flag2 = true
			@users = User.where(chapter_id: chapter).to_a
		end

		if !flag1 and !flag2
			@users = User.all.to_a
		end

		if filt != 0
			case filt
				when 1
					if flag1 and flag2
						@users = @users.select{|user| user.chapter_id == chapter and user.is_over(21)}
					end
					if !flag1 and !flag2
						@users = User.older_than(21)
					end
					if flag1 and !flag2
						@users = @users.select{|user| user.campament_id == campament and user.is_over(21)}
					end
					if !flag1 and flag2
						@users = @users.select{|user| user.chapter_id == chapter and user.is_over(21)}
					end
				when 2
					if flag1 and flag2
						@users = @users.select{|user| user.chapter_id == chapter and user.role == "DeMolay"}
					end
					if !flag1 and !flag2
						@users = User.where(role: "DeMolay").to_a
					end
					if flag1 and !flag2
						@users = @users.select{|user| user.campament_id == campament and user.role == "DeMolay"}
					end
					if !flag1 and flag2
						@users = @users.select{|user| user.chapter_id == chapter and user.role == "DeMolay"}
					end
				when 3
					if flag1 and flag2
						@users = @users.select{|user| user.chapter_id == chapter and user.role == "No DeMolay"}
					end
					if !flag1 and !flag2
						@users = User.where(role: "No DeMolay").to_a
					end
					if flag1 and !flag2
						@users = @users.select{|user| user.campament_id == campament and user.role == "No DeMolay"}
					end
					if !flag1 and flag2
						@users = @users.select{|user| user.chapter_id == chapter and user.role == "No DeMolay"}
					end
			end
		end

		if ord != 0
			case ord
			when 1
				@users.sort_by! &:name
			when 2
				@users.sort_by! &:lastname
			when 3
				@users.sort_by! &:birth_date
			when 4
				@users.sort_by! &:status
			end
		end
	end

	def user_params
    params.require(:user).permit(:email, :name, :lastname, :role, :DeMolayID, :ci, :chapter_id, :campament_id, :birth_date, :city, :adress, :phone, :cellphone, :assurance, :godfather_id, :iniciacion, :father_name, :father_info, :father_adress, :father_mail, :mather_name, :mather_adress, :mather_mail, :estado_civil, :nombre_esposa, :taller_nombre, :taller_numero, :registration_form)
  end

end
