# coding: utf-8

FactoryGirl.define do
  factory :announcement do
    sequence(:subject) { |n| "タイトル%02d" % n }
    sequence(:content) { |n| "お知らせ本文内容%02d" % n }
  end
end
