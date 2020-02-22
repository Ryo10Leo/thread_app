User.create!(user_id: 'dkeij34ju', email: 'sample@example.com',
            password: 'password', password_confirmation: 'password')

User.create!(user_id: 'euhfn46nd', email: 'ryo@example.com',
            password: 'hogehoge', password_confirmation: 'hogehoge')

User.create!(user_id: 'tjnrhk32k', email: 'taro@example.com',
            password: 'abcdefg', password_confirmation: 'abcdefg')

user_1 = User.find(1)
user_2 = User.find(2)
user_3 = User.find(3)

post1 = user_1.posts.create!(title: '【急募】福井県の観光地教えて欲しい！')
post2 = user_2.posts.create!(title: 'オススメの健康食ありますか？')
post3 = user_3.posts.create!(title: '明日大会です！緊張をほぐしたいなー')
post4 = user_2.posts.create!(title: '1ヶ月で5kg痩せる方法ありますか？')
post5 = user_3.posts.create!(title: '余った食材を使い切りたい')
post6 = user_1.posts.create!(title: '【経験者求む】プログラミングって難しいですか？')

Category.create(name:"急募")
Category.create(name:"食事")
Category.create(name:"健康")
Category.create(name:"プログラミング")
Category.create(name:"観光")
Category.create(name:"相談")
Category.create(name:"料理")

PostCategory.create(post_id:1,category_id:5)
PostCategory.create(post_id:2,category_id:2)
PostCategory.create(post_id:2,category_id:3)
PostCategory.create(post_id:2,category_id:6)
PostCategory.create(post_id:3,category_id:6)
PostCategory.create(post_id:4,category_id:1)
PostCategory.create(post_id:4,category_id:3)
PostCategory.create(post_id:4,category_id:6)
PostCategory.create(post_id:5,category_id:2)
PostCategory.create(post_id:5,category_id:7)
PostCategory.create(post_id:6,category_id:4)


reply1 = post6.replies.create!(name:"",content:"はじめまして")
reply2 = post6.replies.create!(name:"",content:"元気ですか？")
reply3 = post6.replies.create!(name:"",content:"こんにちは")
reply4 = post6.replies.create!(name:"",content:"どう思いますか？")
reply5 = post6.replies.create!(name:"",content:"すごいです！！")
reply6 = post6.replies.create!(name:"",content:"元気出して！")
reply7 = post6.replies.create!(name:"",content:"がんばってください！")
reply8 = post6.replies.create!(name:"",content:"ありがとうございました。")

reply1.create_reply_user(user_id: 1)
reply2.create_reply_user(user_id: 2)
reply3.create_reply_user(user_id: 3)
reply4.create_reply_user(user_id: 2)
reply5.create_reply_user(user_id: 1)
reply6.create_reply_user(user_id: 1)
reply7.create_reply_user(user_id: 3)
reply8.create_reply_user(user_id: 2)

reply1 = post5.replies.create!(name:"",content:"はじめまして")
reply2 = post5.replies.create!(name:"",content:"元気ですか？")
reply3 = post5.replies.create!(name:"",content:"こんにちは")
reply4 = post5.replies.create!(name:"",content:"どう思いますか？")
reply5 = post5.replies.create!(name:"",content:"すごいです！！")
reply6 = post5.replies.create!(name:"",content:"元気出して！")
reply7 = post5.replies.create!(name:"",content:"がんばってください！")
reply8 = post5.replies.create!(name:"",content:"ありがとうございました。")

reply1.create_reply_user(user_id: 1)
reply2.create_reply_user(user_id: 2)
reply3.create_reply_user(user_id: 3)
reply4.create_reply_user(user_id: 2)
reply5.create_reply_user(user_id: 1)
reply6.create_reply_user(user_id: 1)
reply7.create_reply_user(user_id: 3)
reply8.create_reply_user(user_id: 2)

