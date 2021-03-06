get '/words' do
  @words = Word.all
  erb :"/words/index"
end

get '/words/new' do
  @word = Word.new
  erb :"words/new"
end

post '/words' do
  word = Word.create(text: params[:text])
  redirect "/words/#{word.id}"
end

get '/words/:id' do
  @word = Word.find(params[:id])
  erb :"/words/show"
end

get '/words/:id/edit' do
  @word = Word.find(params[:id])
  erb :"/words/edit"
end

put '/words/:id' do
  @word = Word.find(params[:id])
  @word.text = params[:text]
  if @word.valid?
    @word.save
    redirect "/words/#{@word.id}"
  else
    erb :"/words/:id/edit"
  end
end

delete '/words/:id' do
  word = Word.find(params[:id])
  word.delete
  redirect "/words"
end
