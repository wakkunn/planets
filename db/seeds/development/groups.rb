# coding: utf-8
group = Group.create!(
  :name => "グループ１"
)

hits = [ 100, 200, 300 ]

catches = [ 10, 20, 30, 40, 50, 60 ]
balls = [
  { :change => 1, :level => 10 },
  { :change => 2, :level => 20 },
  { :change => 3, :level => 30 },
  { :change => 4, :level => 40 },
  { :change => 5, :level => 50 },
]

3.times do |n|
  User.create!(
    :name => "名前#{n}",
    :sex => "男",
    :country => "東京",
    :area => "港区",
    :address1 => "芝大門",
    :address2 => "1-1-1-101",
    :phone => "03-1234-5678",
    :hits => hits,
    :catches => catches,
    :balls => balls,
    :group => group
    )
end