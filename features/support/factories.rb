FactoryGirl.define do
  factory :entry do |e|
    e.posting_date '31/01/2013'
    e.value_date  '01/02/2013'
    e.concept 'TRANSFERENCIA A SU FAVOR'
    e.amount '33,60€'
    e.office '8067'
    e.concept1 'Comunidad 5º Derecha'
  end

  factory :user do |u|
    u.username 'Juan Ruiz'
  end
end