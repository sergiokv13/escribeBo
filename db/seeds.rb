# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Chapters
Chapter.create(chapter_name:"Capitulo 1",chapter_type:"Capitulo",campament:"Cochabamba",chapter_president_id:'4')
Chapter.create(chapter_name:"Capitulo 2",chapter_type:"Capitulo",campament:"Cochabamba",chapter_president_id:'4')

#Users
User.create(email:"oficial@mail.com",password:'arsenal2012',name:'Oficial',lastname:'Ejecutivo',demolayID:'1',role:'No Demolay',ci:'1234567', chapter_id:'1')
User.create(email:"diputado@mail.com",password:'arsenal2012',name:'Diputado',lastname:'Prueba',demolayID:'2',role:'No Demolay',ci:'1234568', chapter_id:'1')
User.create(email:"delegado@mail.com",password:'arsenal2012',name:'Delegado',lastname:'Regional',demolayID:'3',role:'No Demolay',ci:'1234569', chapter_id:'1')
User.create(email:"presidente@mail.com",password:'arsenal2012',name:'Presidente',lastname:'Consejo',demolayID:'4',role:'No Demolay',ci:'1234569', chapter_id:'1')
User.create(email:"maestro@mail.com",password:'arsenal2012',name:'Maestro',lastname:'Consejero',demolayID:'5',role:'No Demolay',ci:'1234571', chapter_id:'1')
User.create(email:"demolay@mail.com",password:'arsenal2012',name:'Demolay',lastname:'Prueba',demolayID:'6',role:'Demolay',ci:'1234572', chapter_id:'1')

#Consultants
User.create(email:"consultor1@mail.com",password:'arsenal2012',name:'Consultor1',lastname:'Prueba',demolayID:'7',role:'No Demolay',ci:'1234', chapter_id:'1')
User.create(email:"consultor2@mail.com",password:'arsenal2012',name:'Consultor2',lastname:'Prueba',demolayID:'8',role:'No Demolay',ci:'1235', chapter_id:'1')
User.create(email:"consultor3@mail.com",password:'arsenal2012',name:'Consultor3',lastname:'Prueba',demolayID:'9',role:'No Demolay',ci:'1236', chapter_id:'1')
