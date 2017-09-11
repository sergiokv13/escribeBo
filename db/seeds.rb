#Campamentos
Campament.create(name: "Bolivia", president_id:"1")     #1
#Campament.create(name: "Cochabamba")                    #2
#Campament.create(name: "La Paz")						#3
#Campament.create(name: "Oruro")							#4
#Campament.create(name: "Pando")							#5
#Campament.create(name: "Potosi")						#6
#Campament.create(name: "Chuquisaca")					#7
#Campament.create(name: "Santa Cruz")					#8
#Campament.create(name: "Tarija")						#9
#Campament.create(name: "Beni")							#10

#city = Array.new

#city[2] = " Cochabamba "
#city[3] = " La Paz "
#city[4] = " Oruro "
#city[5] = " Pando "
#city[6] = " Potosi "
#city[7] = " Chuquisaca "
#city[8] = " Santa Cruz "
#city[9] = " Tarija "
#city[10] = " Beni "


#Capítulos
#1-27
#for c in 2..10#
#	for i in 1..3
#		Chapter.create(chapter_name:"Capítulo" + city[c] + i.to_s,chapter_type:"Capítulo",campament_id: c, number: c.to_s+"-"+i.to_s)
#	end
#end
#Prioratos
#27-45
#for c in 2..10
#	for i in 1..2
#		Chapter.create(chapter_name:"Priorato" + city[c] + i.to_s,chapter_type:"Priorato",campament_id: c, number: c.to_s+"-"+i.to_s)
#	end
#end

#Cortes
#45-54
#for c in 2..10
#	for i in 1..1
#		Chapter.create(chapter_name:"Corte" + city[c] + i.to_s,chapter_type:"Corte",campament_id: c, number: c.to_s+"-"+i.to_s)
#	end
#end


User.create(email:"oficial@mail.com",birth_date: '12/12/12', password:'administrador',name:'Oficial',lastname:'Ejecutivo',demolayID:'1',role:'Trabajador adulto',ci:'1234567', chapter_id:'1', campament_id:'1', president_aproved:true, deputy_aproved:true, oficial_aproved:true, cellphone: '59179777396', phone: '59144229865')

#ids_capitulo = Array.new
#ids_capitulo[2] = [1,2,3]
#ids_capitulo[3] = [4,5,6]
#ids_capitulo[4] = [7,8,9]
#ids_capitulo[5] = [10,11,12]
#ids_capitulo[6] = [13,14,15]
#ids_capitulo[7] = [16,17,18]
#ids_capitulo[8] = [19,20,21]
#ids_capitulo[9] = [22,23,24]
#ids_capitulo[10] = [25,26,27]

#ids_priorato = Array.new
#ids_priorato[2] = [28,29]
#ids_priorato[3] = [30,31]
#ids_priorato[4] = [32,33]
#ids_priorato[5] = [34,35]
#ids_priorato[6] = [36,37]
#ids_priorato[7] = [38,39]
#ids_priorato[8] = [40,41]
#ids_priorato[9] = [42,43]
#ids_priorato[10] = [44,45]

#ids_courte = Array.new
#ids_courte[2] = 46
#ids_courte[3] = 47
#ids_courte[4] = 48
#ids_courte[5] = 49
#ids_courte[6] = 50
#ids_courte[7] = 51
#ids_courte[8] = 52
#ids_courte[9] = 53
#ids_courte[10] = 54

#Users DeMolays
#1 - 1801

#user_id = 1
#for i in 2..10
#	for c in 1..200
#		user_id += 1
#		chapter_id = ids_capitulo[i].sample
=begin		priory_id = ids_priorato[i].sample
		court_id = ids_courte[i]
		lerolero_name = Faker::Name.first_name
		lerolero_lastname =Faker::Name.last_name
		lerolero_fullname = lerolero_name + " " + lerolero_lastname
		User.create(
				email: Faker::Internet.email,
				birth_date: Faker::Date.between(Date.new(1997,1,1), Date.new(2003,1,1)),
				password:'demolay',
				name: lerolero_name,
				lastname: lerolero_lastname,
				full_name: lerolero_fullname,
				demolayID:c,
				role:'DeMolay',
				ci: Faker::Number.number(10),
				chapter_id: chapter_id,
				priory_id: priory_id,
				court_id: court_id,
				campament_id:i,
				president_aproved:true,
				deputy_aproved:true,
				oficial_aproved:true,
				cellphone: '59179777396',
				phone: '59144229865',
				iniciacion: Faker::Date.between(Date.new(1997,1,1), Date.new(2017,5,1))
			)
		Degree.create(
			title: "Iniciatico",
			user_id: user_id,
			chapter_id: chapter_id,
			president_aproved: true,
			deputy_aproved: true,
			oficial_aproved: true
		)
		Degree.create(
				title: "DeMolay",
				user_id: user_id,
				chapter_id: chapter_id,
				president_aproved: true,
				deputy_aproved: true,
				oficial_aproved: true
		)
		Degree.create(
				title: "Caballero",
				user_id: user_id,
				chapter_id: priory_id,
				president_aproved: true,
				deputy_aproved: true,
				oficial_aproved: true
		)
		Degree.create(
				title: "chevalier",
				user_id: user_id,
				chapter_id: court_id,
				president_aproved: true,
				deputy_aproved: true,
				oficial_aproved: true
		)
	end
end


#Users DeMolays
#1801 - X
for i in 2..10
	for c in 1..20
		user_id += 1
		chapter_id = ids_capitulo[i].sample
		priory_id = ids_priorato[i].sample
		court_id = ids_courte[i]
		User.create(
				email: Faker::Internet.email,
				birth_date: Faker::Date.between(Date.new(1997,1,1), Date.new(2003,1,1)),
				password:'no_demolay',
				name: Faker::Name.first_name ,
				lastname: Faker::Name.last_name,
				demolayID:c,
				role:'Trabajador adulto',
				ci: Faker::Number.number(10),
				chapter_id: chapter_id,
				campament_id:i,
				president_aproved:true,
				deputy_aproved:true,
				oficial_aproved:true,
				cellphone: '59179777396',
				phone: '59144229865'
			)

		Consultor = Degree.create(
				title: "Consultor",
				user_id: user_id,
				chapter_id: chapter_id,
				president_aproved: true,
				deputy_aproved: true,
				oficial_aproved: true
		)
		Chapter.find(chapter_id).consultants.push(Consultor)
		Chapter.find(chapter_id).save
		Consultor = Degree.create(
				title: "Consultor",
				user_id: user_id,
				chapter_id: priory_id,
				president_aproved: true,
				deputy_aproved: true,
				oficial_aproved: true
		)
		Chapter.find(priory_id).consultants.push(Consultor)
		Chapter.find(priory_id).save
		Consultor = Degree.create(
				title: "Consultor",
				user_id: user_id,
				chapter_id: court_id,
				president_aproved: true,
				deputy_aproved: true,
				oficial_aproved: true
		)
		Chapter.find(court_id).consultants.push(Consultor)
		Chapter.find(court_id).save
	end
end
=end


#Charges
Charge.create(title:"Oficial Ejecutivo", user_id: '1',campament_id:"1",ente:"Gabinete")




