require 'colorize'

# puts "♟".colorize({ background: :blue, color: :white })

puts " #{"♙".colorize(:black)} ".to_s.colorize({ background: :blue, color: :white })
puts " #{"♟".colorize(:black)} ".to_s.colorize({ background: :blue, color: :white })
puts " #{"♟".colorize(:white)} ".to_s.colorize({ background: :blue, color: :black })
