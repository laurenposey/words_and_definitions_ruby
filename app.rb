require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definition')
require('./lib/word')

get('/') do
  erb(:index)
end

get('/words/new') do
   erb(:words_form)
end

get('/words') do
  @words = Word.all()
  erb(:words)
end

post('/words') do
  word_name = params.fetch('word_name')
  Word.new(word_name).save()
  @words = Word.all()
  erb(:success)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/words/:id/definitions/new') do
    @word = Word.find(params.fetch('id').to_i())
    erb(:add_definitions_form)
end

post('/definitions') do
  word_definition = params.fetch('word_definition')
  @definition = Definition.new(word_definition)
  @definition.save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(@definition)
  erb(:success)
end
