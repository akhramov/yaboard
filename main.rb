require 'sinatra'
require 'mongo'
require 'mongo_mapper'
require 'slim'
MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
MongoMapper.database = 'local'

class Board
  include MongoMapper::Document
  key :name, String
end

get '/' do
  @boards = Board.all
  slim :index, locals: {title: 'Yaboard engine'}
end

# get '/:foo' do |foo|
#   Board.new(name: foo).save!
# end