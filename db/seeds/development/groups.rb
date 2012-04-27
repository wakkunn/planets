# coding: utf-8

3.times do |n|
  Group.create!(
    :name => "グループ#{n+1}"
  )
end