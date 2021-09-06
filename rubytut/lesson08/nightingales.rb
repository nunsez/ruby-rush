temp = ARGV[0]

if temp
    temp = temp.to_i
else
    puts 'Какая сейчас температура?'
    temp = $stdin.gets.to_i
end

season = ARGV[1]

if season
    season = season.to_i
else
    puts 'Какое время года? (0 - весна, 1 - лето, 2 - осень, 3 - зима)'
    season = $stdin.gets.to_i
end

# rubocop:disable Lint/DuplicateBranch

if (season == 1) && (temp >= 15) && (temp < 35)
    puts 'Скорее идите в парк, соловьи поют!'
elsif (temp >= 22) && (temp < 30)
    puts 'Скорее идите в парк, соловьи поют!'
else
    puts 'Сейчас соловьи молчат, греются или прохлаждаются :)'
end

# rubocop:enable Lint/DuplicateBranch
