require 'csv'

puts '1 → 新規でメモを作成する / 2 → 既存のメモを編集する'

# # ユーザーのキーワード入力を待機
input_val = gets.to_i

if input_val == 1
    puts '拡張子を除いたファイル名を入力してください。'
    new_name = gets.chomp
    File.write("#{new_name}.csv", <<CSV)
CSV
    puts 'メモしたい内容を入力してください。'

    CSV.read("#{new_name}.csv", headers: false)

    CSV.open("#{new_name}.csv", 'w') do |test|
        memo = gets.chomp
        test << [memo]
    end

elsif input_val == 2
    puts '編集したい既存のファイル名を入力してください。'
    file_name = gets.chomp

    CSV.open("#{file_name}", 'w') do |test|
    test << [gets.chomp]
    end
else
    puts '"1"か"2"を入力してください。'
end