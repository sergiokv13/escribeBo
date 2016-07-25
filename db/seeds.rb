# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Campament.create(name: "Bolivia", president_id:"1")
#Campament.create(name: "Cochabamba")
#Campament.create(name: "La Paz")
#Campament.create(name: "Santa Cruz")

#Chapters
Chapter.create(chapter_name:"Capitulo 1",chapter_type:"Capitulo",campament_id: "1",chapter_president_id:"1",number:"134")
#Chapter.create(chapter_name:"Capitulo 2",chapter_type:"Capitulo",campament_id: "1",chapter_president_id:"1",number:"135")
#Chapter.create(chapter_name:"Capitulo 3",chapter_type:"Capitulo",campament_id: "1",chapter_president_id:"1",number:"136")

#Users
User.create(email:"oficial@mail.com",birth_date: '12/12/12', password:'administrador',name:'Oficial',lastname:'Ejecutivo',DeMolayID:'1',role:'No DeMolay',ci:'1234567', chapter_id:'1', campament_id:'1', president_aproved:true, deputy_aproved:true, oficial_aproved:true)


#Charges
Charge.create(title:"Oficial Ejecutivo", user_id: '1',campament_id:"1")
