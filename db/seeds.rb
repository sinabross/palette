# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    xlsx_lip = Roo::Excelx.new("xlsx/lipdb.xlsx")
    input_lip= xlsx_lip.parse(  num: 'num',
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
     input_lip.each_with_index do |item, index|
        next if index == 0
        Lipdb.create(item)
    end
                         
    xlsx_eye = Roo::Excelx.new("xlsx/eyedb.xlsx")
    input_eye= xlsx_eye.parse(  num: 'num',
                                wc: 'wc',
                                season: 'season',
                                tone: 'tone', 
                                brand: 'brand',
                                name: 'name',
                                price: 'price',
                                size: 'size',
                                zzim: 'zzim',
                                pro_type: 'pro_type',
                                glitter: 'glitter')
    
    
    
    input_eye.each_with_index do |item, index|
        next if index == 0
        Eyedb.create(item)
    end
    
    
    User.create(email: 'user@gmail.com', password: 'useruser')