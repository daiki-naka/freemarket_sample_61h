FactoryBot.define do
  factory :user do
    nickname              { {session:{nickname: "mercaritaro"}} }
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}   
    last_name             {"山田"} 
    name                  {"太郎"}
    last_name_f           {"ヤマダ"}
    name_f                {"タロウ"}
    birthday              {"1900-01-01"}
    phone_number          {"00000000000"}
    d_last_name           {"山田"}
    d_name                {"太郎"}
    d_last_name_f         {"ヤマダ"}
    d_name_f              {"タロウ"}
    postal_code           {"0000000"}
    prefecture            {"東京"}
    city                  {"世田谷"}
    address               {"青山"}          
  end
end
