class AdminControllerController < ApplicationController

	def newUser
		@roles = [['Demolay', 'Demolay'], ['No Demolay', 'No Demolay']]
		@campaments = [['Cochabamba','Cochabamba'],['La Paz','La Paz'],['Santa Cruz','Santa Cruz'],['Chuquisaca','Chuquisaca'],['Beni','Beni'],['Oruro','Oruro'],['Pando','Pando'],['Potosi','Potosi'],['Tarija','Tarija']]
		@chapters = Chapter.where(:chapter_type =>"Capitulo").all
	end

	def update_chapters
	  @chapters = Chapter.where(:campament => params[:campament]).where(:chapter_type =>"Capitulo").all
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
