# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Kv.create( key: "sn", value: "JB0001" )
Kv.create( key: "latitude", value: "37.3606268959633" )
Kv.create( key: "longitude", value: "-121.9743434218259")
Kv.create( key: "radish", value: "0")
Kv.create( key: "pea", value: "0")
Kv.create( key: "marigold", value: "0")
Kv.create( key: "morning_glory", value: "2")
Kv.create( key: "unidentified", value: "0")
Kv.create( key: "pump_time", value: "0.0")

Dose.create( species: "pea", pump_time: 0.0)
Dose.create( species: "radish", pump_time: 0.0)
Dose.create( species: "marigold", pump_time: 0.6)
Dose.create( species: "morning_glory", pump_time: 0.6)
Dose.create( species: "unidentified", pump_time: 0.0)
