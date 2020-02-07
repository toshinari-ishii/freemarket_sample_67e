# 1番目
# user1 = User.new(
#   email: "first@gmail.com", 
#   password: "First1111", 
#   created_at: DateTime.now, 
#   updated_at: DateTime.now,
#   nickname: "first",
#   last_name: "一",
#   first_name: "一一",
#   first_hurigana: "いちいち",
#   last_hurigana: "いち",
#   birthday: "2000-01-01",
#   postcode: "111-1111",
#   prefecture: "一県",
#   city: "一市",
#   block: "一番地",
#   room: "一号",
#   phone_number: "11-1111-1111"
# )

# 2番目
user2 = User.new(
  email: "second@gmail.com", 
  password: "Second2222", 
  created_at: DateTime.now, 
  updated_at: DateTime.now,
  nickname: "second",
  last_name: "二",
  first_name: "二二",
  first_hurigana: "にに",
  last_hurigana: "に",
  birthday: "2000-02-02",
  postcode: "222-2222",
  prefecture: "二県",
  city: "二市",
  block: "二番地",
  room: "二号",
  phone_number: "22-2222-2222"
)

# 3番目
user3 = User.new(
  email: "third@gmail.com", 
  password: "Third3333", 
  created_at: DateTime.now, 
  updated_at: DateTime.now,
  nickname: "third",
  last_name: "三",
  first_name: "三三",
  first_hurigana: "さんさん",
  last_hurigana: "さん",
  birthday: "2000-03-03",
  postcode: "333-3333",
  prefecture: "三県",
  city: "三市",
  block: "三番地",
  room: "三号",
  phone_number: "33-3333-3333"
)

# 4番目
user4 = User.new(
  email: "fourth@gmail.com", 
  password: "Fourth4444", 
  created_at: DateTime.now, 
  updated_at: DateTime.now,
  nickname: "fourth",
  last_name: "四",
  first_name: "四四",
  first_hurigana: "よんよん",
  last_hurigana: "よん",
  birthday: "2000-04-04",
  postcode: "444-4444",
  prefecture: "四県",
  city: "四市",
  block: "四番地",
  room: "四号",
  phone_number: "44-4444-4444"
)

# 5番目
user5 = User.new(
  email: "fifth@gmail.com", 
  password: "Fifth5555", 
  created_at: DateTime.now, 
  updated_at: DateTime.now,
  nickname: "fifth",
  last_name: "五",
  first_name: "五五",
  first_hurigana: "ごご",
  last_hurigana: "ご",
  birthday: "2000-05-05",
  postcode: "555-5555",
  prefecture: "五県",
  city: "五市",
  block: "五番地",
  room: "五号",
  phone_number: "55-5555-5555"
)

user1.save!
user2.save!
user3.save!
user4.save!
user5.save!

