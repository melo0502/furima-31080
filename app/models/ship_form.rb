class ShipForm < ActiveHash::Base
  self.data = [
    {id: 1, ship_form_id: '--'},
    {id: 2, ship_form_id: '北海道'}, {id: 3, ship_form_id: '青森県'}, {id: 4, ship_form_id: '岩手県'},
    {id: 5, ship_form_id: '宮城県'}, {id: 6, ship_form_id: '秋田県'}, {id: 7, ship_form_id: '山形県'},
    {id: 8, ship_form_id: '福島県'}, {id: 9, ship_form_id: '茨城県'}, {id: 10, ship_form_id: '栃木県'},
    {id: 11, ship_form_id: '群馬県'}, {id: 12, ship_form_id: '埼玉県'}, {id: 13, ship_form_id: '千葉県'},
    {id: 14, ship_form_id: '東京都'}, {id: 15, ship_form_id: '神奈川県'}, {id: 16, ship_form_id: '新潟県'},
    {id: 17, ship_form_id: '富山県'}, {id: 18, ship_form_id: '石川県'}, {id: 19, ship_form_id: '福井県'},
    {id: 20, ship_form_id: '山梨県'}, {id: 21, ship_form_id: '長野県'}, {id: 22, ship_form_id: '岐阜県'},
    {id: 23, ship_form_id: '静岡県'}, {id: 24, ship_form_id: '愛知県'}, {id: 25, ship_form_id: '三重県'},
    {id: 26, ship_form_id: '滋賀県'}, {id: 27, ship_form_id: '京都府'}, {id: 28, ship_form_id: '大阪府'},
    {id: 29, ship_form_id: '兵庫県'}, {id: 30, ship_form_id: '奈良県'}, {id: 31, ship_form_id: '和歌山県'},
    {id: 32, ship_form_id: '鳥取県'}, {id: 33, ship_form_id: '島根県'}, {id: 34, ship_form_id: '岡山県'},
    {id: 35, ship_form_id: '広島県'}, {id: 36, ship_form_id: '山口県'}, {id: 37, ship_form_id: '徳島県'},
    {id: 38, ship_form_id: '香川県'}, {id: 39, ship_form_id: '愛媛県'}, {id: 40, ship_form_id: '高知県'},
    {id: 41, ship_form_id: '福岡県'}, {id: 42, ship_form_id: '佐賀県'}, {id: 43, ship_form_id: '長崎県'},
    {id: 44, ship_form_id: '熊本県'}, {id: 45, ship_form_id: '大分県'}, {id: 46, ship_form_id: '宮崎県'},
    {id: 47, ship_form_id: '鹿児島県'}, {id: 48, ship_form_id: '沖縄県'}
]

include ActiveHash::Associations
has_many :item

end

