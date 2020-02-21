User.create!(user_id: 'dkeij34ju', email: 'sample@example.com',
            password: 'password', password_confirmation: 'password')

User.create!(user_id: 'euhfn46nd', email: 'ryo@example.com',
            password: 'hogehoge', password_confirmation: 'hogehoge')

User.create!(user_id: 'tjnrhk32k', email: 'taro@example.com',
            password: 'abcdefg', password_confirmation: 'abcdefg')

user_1 = User.find(1)
user_2 = User.find(2)
user_3 = User.find(3)

user_1.posts.create!(title: '【急募】福井県の観光地教えて欲しい！')
user_2.posts.create!(title: 'オススメの健康食ありますか？')
user_3.posts.create!(title: '明日大会です！緊張をほぐしたいなー')
user_2.posts.create!(title: '1ヶ月で5kg痩せる方法ありますか？')
user_3.posts.create!(title: '余った食材を使い切りたい')
user_1.posts.create!(title: '【経験者求む】プログラミングって難しいですか？')

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