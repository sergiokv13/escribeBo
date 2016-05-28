# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Campament.create(name: "Cochabamba")
Campament.create(name: "La Paz")
Campament.create(name: "Santa Cruz")

#Chapters
Chapter.create(chapter_name:"Capitulo 1",chapter_type:"Capitulo",campament_id: "1",chapter_president_id:"1")
Chapter.create(chapter_name:"Capitulo 2",chapter_type:"Capitulo",campament_id: "1",chapter_president_id:"1")
Chapter.create(chapter_name:"Capitulo 3",chapter_type:"Capitulo",campament_id: "1",chapter_president_id:"1")

#Users
User.create(email:"oficial@mail.com",password:'arsenal2012',name:'Oficial',lastname:'Ejecutivo',demolayID:'1',role:'No Demolay',ci:'1234567', chapter_id:'1', campament_id:'1', president_aproved:true, deputy_aproved:true, oficial_aproved:true)


User.create(email:"diputado@mail.com",password:'arsenal2012',name:'Diputado',lastname:'Prueba',demolayID:'2',role:'No Demolay',ci:'1234568', chapter_id:'1', campament_id:'1', president_aproved:true, deputy_aproved:true, oficial_aproved:true)

User.create(email:"delegado@mail.com",password:'arsenal2012',name:'Delegado',lastname:'Regional',demolayID:'3',role:'No Demolay',ci:'1234569', chapter_id:'1', campament_id:'1', president_aproved:true, deputy_aproved:true, oficial_aproved:true)
User.create(email:"delegado1@mail.com",password:'arsenal2012',name:'Delegado',lastname:'Regional',demolayID:'31',role:'No Demolay',ci:'12342369', chapter_id:'1', campament_id:'1', president_aproved:true, deputy_aproved:true, oficial_aproved:true)
User.create(email:"delegado2@mail.com",password:'arsenal2012',name:'Delegado',lastname:'Regional',demolayID:'32',role:'No Demolay',ci:'112342369', chapter_id:'1', campament_id:'1', president_aproved:true, deputy_aproved:true, oficial_aproved:true)

User.create(email:"presidente@mail.com",password:'arsenal2012',name:'Presidente',lastname:'Consejo',demolayID:'4',role:'No Demolay',ci:'1234569', chapter_id:'1', campament_id:'1', president_aproved:true, deputy_aproved:true, oficial_aproved:true)
User.create(email:"presidente1@mail.com",password:'arsenal2012',name:'Presidente',lastname:'Consejo',demolayID:'41',role:'No Demolay',ci:'1234569', chapter_id:'1', campament_id:'1', president_aproved:true, deputy_aproved:true, oficial_aproved:true)
User.create(email:"maestro@mail.com",password:'arsenal2012',name:'Maestro',lastname:'Consejero',demolayID:'5',role:'Demolay',ci:'1234571', chapter_id:'1', campament_id:'1', president_aproved:true, deputy_aproved:true, oficial_aproved:true)

User.create(email:"demolay@mail.com",password:'arsenal2012',name:'Demolay',lastname:'Prueba',demolayID:'6',role:'Demolay',ci:'1234572', chapter_id:'1', campament_id:'1', president_aproved:true, deputy_aproved:true, oficial_aproved:true)
User.create(email:"demolay1@mail.com",password:'arsenal2012',name:'Demolay',lastname:'Prueba',demolayID:'61',role:'Demolay',ci:'1434572', chapter_id:'1', campament_id:'1', president_aproved:true, deputy_aproved:true, oficial_aproved:true)
User.create(email:"demolay2@mail.com",password:'arsenal2012',name:'Demolay',lastname:'Prueba',demolayID:'62',role:'Demolay',ci:'1764572', chapter_id:'1', campament_id:'1', president_aproved:true, deputy_aproved:true, oficial_aproved:false)

#Consultants
User.create(email:"consultor1@mail.com",password:'arsenal2012',name:'Consultor1',lastname:'Prueba',demolayID:'7',role:'No Demolay',ci:'1234', chapter_id:'1', campament_id:'1', president_aproved:true, deputy_aproved:true, oficial_aproved:true)
User.create(email:"consultor2@mail.com",password:'arsenal2012',name:'Consultor2',lastname:'Prueba',demolayID:'8',role:'No Demolay',ci:'1235', chapter_id:'1', campament_id:'1', president_aproved:true, deputy_aproved:true, oficial_aproved:true)
User.create(email:"consultor3@mail.com",password:'arsenal2012',name:'Consultor3',lastname:'Prueba',demolayID:'9',role:'No Demolay',ci:'1236', chapter_id:'1', campament_id:'1', president_aproved:true, deputy_aproved:true, oficial_aproved:true)

#Charges
Charge.create(title:"Oficial Ejecutivo", user_id: '1')
Charge.create(title:"Delegado Regional", user_id: '1')
Charge.create(title:"Presidente Consejo Consultivo", user_id: '1')

#Degrees
Degree.create(title:"Consultor", user_id:"7", chapter_id:"1")
Degree.create(title:"Consultor", user_id:"8", chapter_id:"1")
Degree.create(title:"Consultor", user_id:"9", chapter_id:"1")
