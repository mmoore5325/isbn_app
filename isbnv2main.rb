require 'sinatra'
require_relative 'isbnv2test.rb'
require_relative 'isbnv2_13.rb'

get '/' do
	erb :isbnchoose
end

post '/isbnchoose' do
	isbn = params[:isbntype]

	if isbn == "ISBN-13"
		redirect '/isbn_13'
	else isbn == "ISBN-10"
		redirect '/isbn_10'
	end
end

get '/isbn_13' do

	erb :isbn_13

end

post '/isbn_13' do

	isbn13 = params[:isbn_13]
	
	isbn13valid_length = valid_isbn_13?(isbn13)

	if isbn13valid_length == false
		redirect '/invalid_isbn'
	elsif isbn13valid_length == true
		
		isbn13check = validate_isbn_13?(isbn13)
		
		if isbn13check == true
			redirect '/valid_isbn'
		else
			redirect '/invalid_isbn'
		end
	end
end

get '/isbn_10' do

	erb :isbn_10

end

post '/isbn_10' do

	isbn10 = params[:isbn_10]
	isbn10valid_length = valid_isbn_10?(isbn10)

	if isbn10valid_length == false
		redirect '/invalid_isbn'
	else
		isbn10check = validate_isbn_10?(isbn10)
		if isbn10check == true
			redirect 'valid_isbn'
		else
			redirect 'invalid_isbn'
		end
	end
end

get '/invalid_isbn' do

	erb :invalid_isbn

end

post 'invalid_isbn' do

	isbn = params[:isbntype]

	if isbn == "ISBN-13"
		redirect '/isbn_13'
	else isbn == "ISBN-10"
		redirect '/isbn_10'
	end
end


get '/valid_isbn' do

	erb :valid_isbn

end
# get '/valid_isbn'
	
# 	erb :valid_isbn
# end

# post '/valid_isbn'

# 	isbn = params[:isbntype]

# 	if isbn == "ISBN-13"
# 		redirect '/isbn_13'
# 	else isbn == "ISBN-10"
# 		redirect '/isbn_10'
# 	end
# end


	





