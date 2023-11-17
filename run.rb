# frozen_string_literal: true

# Based on https://github.com/digital-fabric/polyphony/blob/master/examples/adapters/sequel_pg.rb

require 'bundler/setup'
require 'sequel'
# require 'polyphony'
# require 'polyphony/adapters/sequel'
# require 'polyphony/adapters/postgres'

URL = ENV['SEQUEL_URL'] || 'postgres://localhost/test'

x = 10000
query_count = 0

db = Sequel.connect(URL)
x.times { query_count += 1; db.execute('select 1 as test') }
t0 = Time.now
puts "query rate: #{query_count / (Time.now - t0)} reqs/s; count = #{query_count}"

# spin do
#   db = Sequel.connect(URL)
#   x.times { query_count += 1; db.execute('select 1 as test') }
# end

# spin do
#   db = Sequel.connect(URL)
#   x.times { query_count += 1; db.execute('select 2 as test') }
# end

# t0 = Time.now
# Fiber.current.await_all_children
# puts "query rate: #{query_count / (Time.now - t0)} reqs/s; count = #{query_count}"
