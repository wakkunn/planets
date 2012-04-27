# coding: utf-8

5.times do |n|
  Announcement.create!(
    :subject => "第#{n+1}回赤坂リーグに参加しました！！",
    :content => "これは説明です" * 25
  )
end