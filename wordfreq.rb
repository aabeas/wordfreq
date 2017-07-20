require 'pry'

words = {}

stopWords = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'by', 'for', 'from', 'has', 'he', 'i', 'in', 'is', 'it', 'its', 'of', 'on', 'that', 'the', 'to', 'were', 'will', 'with']

contents = File.read("emancipation_proclamation.txt")
contents.gsub!(/\n+1,|[|]|--|!|\.|'s|:|,|;/, " ")
contents.downcase!
wordsArray = contents.split(" ")

stopWords.each do |remove_word|
  wordsArray.delete(remove_word)
end

wordsArray.each do |word|
  words[word] = 0 if words[word].nil?
  words[word] += 1
end

wordSort = words.sort_by{|key, value| value}.reverse

wordSort.each do |key, value|
  printf("%25s", "#{key} | ")
  printf("%-10s","#{value} " + "*"* value)
  puts
end
