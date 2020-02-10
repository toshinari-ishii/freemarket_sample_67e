# 1番目
user1 = User.new(
  email: "firsts@gmail.com", 
  password: "Firsts1111", 
  created_at: DateTime.now, 
  updated_at: DateTime.now,
  nickname: "小松菜奈",
  last_name: "小松",
  first_name: "菜奈",
  first_hurigana: "なな",
  last_hurigana: "こまつ",
  birthday: "1996-02-16",
  postcode: "111-1111",
  prefecture: "沖縄県",
  city: "うるま市",
  block: "宮里841-9",
  room: "コアマンション松保町",
  phone_number: "11-1111-1111"
)

# 2番目
user2 = User.new(
  email: "second@gmail.com", 
  password: "Second2222", 
  created_at: DateTime.now, 
  updated_at: DateTime.now,
  nickname: "北川景子",
  last_name: "北川",
  first_name: "景子",
  first_hurigana: "けいこ",
  last_hurigana: "きたがわ",
  birthday: "1986-08-22",
  postcode: "222-2222",
  prefecture: "茨城県",
  city: "常総市",
  block: "本石下44-12",
  room: "アドバンス21パンセ琴芝",
  phone_number: "22-2222-2222"
)

# 3番目
user3 = User.new(
  email: "third@gmail.com", 
  password: "Third3333", 
  created_at: DateTime.now, 
  updated_at: DateTime.now,
  nickname: "中条あやみ",
  last_name: "中条",
  first_name: "あやみ",
  first_hurigana: "あやみ",
  last_hurigana: "なかじょう",
  birthday: "1997-02-04",
  postcode: "333-3333",
  prefecture: "富山県",
  city: "富山市",
  block: "宮保846-2",
  room: "レジデンス山の田",
  phone_number: "33-3333-3333"
)

# 4番目
user4 = User.new(
  email: "fourth@gmail.com", 
  password: "Fourth4444", 
  created_at: DateTime.now, 
  updated_at: DateTime.now,
  nickname: "綾瀬はるか",
  last_name: "綾瀬",
  first_name: "はるか",
  first_hurigana: "はるか",
  last_hurigana: "あやせ",
  birthday: "1985-03-24",
  postcode: "444-4444",
  prefecture: "福井県",
  city: "あわら市",
  block: "温泉2-738-9",
  room: "オーヴィジョン防府駅天神口",
  phone_number: "44-4444-4444"
)

# 5番目
user5 = User.new(
  email: "fifth@gmail.com", 
  password: "Fifth5555", 
  created_at: DateTime.now, 
  updated_at: DateTime.now,
  nickname: "田中麗奈",
  last_name: "田中",
  first_name: "麗奈",
  first_hurigana: "れいな",
  last_hurigana: "たなか",
  birthday: "1980-05-22",
  postcode: "555-5555",
  prefecture: "青森県",
  city: "弘前市",
  block: "弥生32-14",
  room: "コープ小野田",
  phone_number: "55-5555-5555"
)

# 6番目
user6 = User.new(
  email: "sixth@gmail.com", 
  password: "Sixth6666", 
  created_at: DateTime.now, 
  updated_at: DateTime.now,
  nickname: "橋本環奈",
  last_name: "橋本",
  first_name: "環奈",
  first_hurigana: "かんな",
  last_hurigana: "はしもと",
  birthday: "1999-02-03",
  postcode: "555-5555",
  prefecture: "新潟県",
  city: "十日町市",
  block: "春日町709-1",
  room: "アルファライフ",
  phone_number: "66-6666-6666"
)

user1.save!
user2.save!
user3.save!
user4.save!
user5.save!
user6.save!

