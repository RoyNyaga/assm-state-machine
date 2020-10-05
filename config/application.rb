require 'bundler'
Bundler.require

Dir.glob('./app/*.rb').each { |file| require file }