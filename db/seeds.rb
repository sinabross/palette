# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    xlsx = Roo::Excelx.new("xlsx/testdb.xlsx")
    input= xlsx.parse(  num: 'num',
                        wc: 'wc',
                        season: 'season',
                        tone: 'tone', 
                        brand: 'brand',
                        name: 'name',
                        price: 'price',
                        size: 'size',
                        zzim: 'zzim',
                        pro_type: 'pro_type',
                        glitter: 'glitter',
                        texture: 'texture')
    
    input.each_with_index do |item, index|
        next if index == 0
        Testdb.create(item)
    end