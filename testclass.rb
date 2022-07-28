require 'json'

#
# def save(fileName, data)
#     File.open("./files/#{data}.json", "w+") do |f|
#       f << data.to_json
#     end
# end
#
# def load(data)
#     data = nil
#     if File.exists?("./files/#{data}.json")
#         File.open("./files/#{data}.json") do |f|
#             data = JSON.parse(f.read)
#         end
#     data
#     end
# end

class A
  def initialize(letter)
    @b = letter
  end
end

store = [A.new('a'), A.new('b'), A.new('c')]

puts store

r1 = JSON.generate(store)

puts r1
