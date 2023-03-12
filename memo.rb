require 'csv'

puts '1 → 新規でメモを作成する / 2 → 既存のメモを編集する'

input_val = gets.to_i

if input_val == 1
  puts '拡張子を除いたファイル名を入力してください。'
  #   新規ファイルの作成
  new_name = gets.chomp
  File.new("#{new_name}.csv", 'w')

  puts 'メモしたい内容を入力してください。'
  puts '完了したらCtrl+Dをしてください。'

  #   新規ファイルに書き込み
  memos = $stdin.readlines
  CSV.open("#{new_name}.csv", 'w') do |test|
    for memo in memos do
      test << [memo.chomp]
      end
  end

elsif input_val == 2
  puts '編集したい既存のファイル名を入力してください。(拡張子除く)'
  file_name = gets.chomp

  puts 'メモしたい内容を入力してください。'
  puts '完了したらCtrl+Dをしてください。'

  # 既存ファイルデータの読み込み
  #   puts CSV.read("#{file_name}.csv")

  # 既存ファイルに書き込み
  memos = $stdin.readlines
  CSV.open("#{file_name}.csv", 'a') do |test|
    for memo in memos do
      test << [memo.chomp]
    end
  end
else
  puts '"1"か"2"を入力してください。'
end
