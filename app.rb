require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  erb(:index)
end

get('/words/new') do
  erb(:dictionary_form)
end

get('/words') do
  @words = Word.all()
  erb(:words)
end

post('/words') do
  word_name = params.fetch('word_name')
  Word.new(:word_name => word_name).save()
  @words = Word.all()
  erb(:words)
end
