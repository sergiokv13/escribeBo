class AdminControllerController < ApplicationController

	def newUser
		@roles = [['Demolay', 'Demolay'], ['No Demolay', 'No Demolay']]
		@campaments = Campament.all
		@chapters = Chapter.where(:chapter_type =>"Capitulo").all
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
		@user.demolayID = params[:demolayID]
		@user.ci = params[:ci]
		@user.chapter_id = params[:chapter_id]
		@user.campament_id = params[:campament]
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
		if current_user.is_president
			@users_to_approve = User.where(president_aproved: [false, nil])
		end
		if current_user.is_deputy
			@users_to_approve = User.where(deputy_aproved: [false, nil], president_aproved: true)
		end
		if current_user.is_oficial
			@users_to_approve = User.where(oficial_aproved: [false, nil], deputy_aproved: true, president_aproved: true)
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

end
