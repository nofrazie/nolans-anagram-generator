get '/' do
  erb :index
end

post '/' do
  word = params[:word]
  redirect "/anagrams/#{word}"
end


get '/anagrams/:word' do
  @word = params[:word]
  alphabetized_string = @word.chars.sort.join
  @anagrams = Word.where("letters=?", alphabetized_string)
  erb :show
end
