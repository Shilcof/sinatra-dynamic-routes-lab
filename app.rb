require_relative 'config/environment'
class App < Sinatra::Base
  # Write your code here!

  get "/reversename/:name" do
    "#{params[:name].reverse}"
  end

  get "/square/:number" do
    "#{params[:number].to_i**2}"
  end

  get "/say/:number/:phrase" do
    "#{params[:phrase]}"*params[:number].to_i
  end

  get "/say/:word1/:word2/:word3/:word4/:word5" do
    "#{(1..5).collect{|n| params["word#{n}".to_sym]}.join(" ")}."
  end

  get "/:operation/:number1/:number2" do
    a = params[:number1].to_i
    b = params[:number2].to_i
    ops = {add: :+, subtract: :-, multiply: :*, divide: :/}
    op = ops[params[:operation].to_sym]
    "#{a.send(op, b)}"
  end

end