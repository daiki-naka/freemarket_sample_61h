FactoryBot.define do
  factory :product do
    name            {"商品の名前"}
    introduction    {"出品したい商品の紹介文"}
    status          {"新品、未使用"}
    d_charge        {"送料込み(出品者負担)"}
    d_method        {"ゆうメール"}
    d_origin        {"東京都"}
    d_interval      {"1~2日で発送"}
    price           {"400"}
    product_size    {"M"}
    user_id         {"1"}
    category_id     {"120"}
    brand_id        {"1"}
  end
end
