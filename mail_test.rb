require 'mandrill'
require 'sinatra'

msg = Mandrill::API.new

get '/' do
  erb :form  
end

post '/contact-submit' do
  body = {
    :subject => params[:subject],
    :from_name => params[:from_name],
    :from_email => params[:from_email],
    :to => [{:name => params[:to_name], :email => params[:to_email]}],
    # you can have more than one recipient, just add another hash in the value for :to similar to the one already there
    :html => params[:message],
    :text => params[:message] # fallback if html fails
  }
  
  result = msg.messages.send body
  puts result

  "Thanks for your submission!"
end