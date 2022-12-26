# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'json'

puts "Cleaning up database..."
Movie.destroy_all
puts "Database cleaned"

url = "http://tmdb.lewagon.com/movie/top_rated"

# importe les résultats des 10 premières pages
# https://api.themoviedb.org/3/discover/movie?api_key=### . => page 1
# https://api.themoviedb.org/3/discover/movie?api_key=###&page=2 => page 2

# 10.times do |i|
  # puts "Importing movies from page #{i + 1}"
  # array de 20 films pour une page i
  # movies = JSON.parse(URI.open("#{url}?page=#{i + 1}").read)['results']

  puts "Importing movies from page 1"
  movies = JSON.parse(URI.open(url).read)['results']
  # je crée les films de la page i
  movies.each do |movie|
    puts "Creating #{movie['title']}"
    base_poster_url = "https://image.tmdb.org/t/p/original"
    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      poster_url: "#{base_poster_url}#{movie['backdrop_path']}", # movie['poster_path']
      rating: movie['vote_average']
    )
  end
# end
puts "Movies created"
