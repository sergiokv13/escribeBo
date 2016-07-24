# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Campament.create(name: "Bolivia", president_id:"1")
User.create(email:"oficial@mail.com",birth_date: '12/12/12', password:'arsenal2012',name:'Oficial',lastname:'Ejecutivo',demolayID:'1',role:'No Demolay',ci:'1234567', chapter_id:'1', campament_id:'1', president_aproved:true, deputy_aproved:true, oficial_aproved:true)
Charge.create(title:"Oficial Ejecutivo", user_id: '1',campament_id:"1")
