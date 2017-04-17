# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


 #자연광 DB
    xlsx_lip = Roo::Excelx.new("xlsx/lipdb170417.xlsx")
    input_lip= xlsx_lip.parse(  num: 'num',
                                image: 'image',
                                name: 'name',
                                brand: 'brand',
                                level: 'level',
                                color: 'color',
                                wc: 'wc',
                                tone_weak1: 'tone_weak1',
                                tone_weak2: 'tone_weak2',
                                tone_strong1: 'tone_strong1',
                                tone_strong2: 'tone_strong2',
                                season_1: 'season_1',
                                season_2: 'season_2',
                                price: 'price',
                                size: 'size',
                                pro_type: 'pro_type',
                                glitter: 'glitter',
                                texture: 'texture',
                                keyword: 'keyword')
     input_lip.each_with_index do |item, index|
        next if index == 0
        Lip.create(item)
    end





# 팔목디비(초기)
#    xlsx_lip = Roo::Excelx.new("xlsx/lipdb161212.xlsx")
#    input_lip= xlsx_lip.parse(  num: 'num',
#                                image: 'image',
#                                wc: 'wc',
#                                season: 'season',
#                               tone: 'tone',
#                                brand: 'brand',
#                                name: 'name',
#                                price: 'price',
#                                size: 'size',
#                                color: 'color',
#                                pro_type: 'pro_type',
#                                glitter: 'glitter',
#                                texture: 'texture',
#                                keyword: 'keyword',
#                                level: 'level')
#     input_lip.each_with_index do |item, index|
#        next if index == 0
#        Lip.create(item)
#    end
    
    
    
# 아크릴 디비
#    xlsx_lip = Roo::Excelx.new("xlsx/lipdb0.6.xlsx")
#    input_lip= xlsx_lip.parse(  num: 'num',
#                                image: 'image',
#                                color_PA: 'color_PA',
#                                season_PA: 'season_PA',
#                                tone_PA: 'tone_PA',
#                                color_BY: 'color_BY',
#                                season_BY: 'season_BY',
#                                tone_BY: 'tone_BY',
#                                color_YS: 'color_YS',
#                                season_YS: 'season_YS',
#                                tone_YS: 'tone_YS',
#                                color_total: 'color_total',
#                                season_total: 'season_total',
#                                tone_total: 'tone_total',
#                                comment_PA: 'comment_PA',
#                                comment_BY: 'comment_BY',
#                                comment_YS: 'comment_YS',
#                                brand: 'brand',
#                                name: 'name',
#                                price: 'price',
#                                size: 'size',
#                                zzim: 'zzim',
#                                pro_type: 'pro_type',
#                                glitter: 'glitter',
#                                texture: 'texture',
#                                keyword: 'keyword')
#     input_lip.each_with_index do |item, index|
#        next if index == 0
#        Lipdb.create(item)
#    end
                         
   # xlsx_eye = Roo::Excelx.new("xlsx/eyedb.xlsx")
    #input_eye= xlsx_eye.parse(  num: 'num',
     #                           wc: 'wc',
      #                          season: 'season',
       #                         tone: 'tone',
        #                        brand: 'brand',
         #                       name: 'name',
          #                      price: 'price',
           #                     size: 'size',
            #                    zzim: 'zzim',
             #                   pro_type: 'pro_type',
              #                  glitter: 'glitter')
    
    
    
  #  input_eye.each_with_index do |item, index|
   #     next if index == 0
    #    Eyedb.create(item)
    #end
    
    
   # User.create(username: '테스트유저', userseason: '봄', email: 'user@gmail.com', password: 'useruser')
   # User.create(username: '관리자', userseason: "없음", email: "admin@gmail.com", password: 'adminadmin', admin:true)
    #Admin.create(email: 'admin@gmail.com', password: 'adminadmin')
   

  # 제품 DB 업데이트 할 때 이거 주석해제하고 위에 roo 코드는 임시로 주석처리
   # test_lip = Lipdb.find_or_initialize_by(num: 'L560')
   # test_lip.wc = '웜'
   # test_lip.tone = '뮤트'
   # test_lip.save!
