class SessionsController < ApplicationController
def new 
end
def  create
	user = User.find_by(email: params[:session][:email].downcase)
	if user && user.authenticate(params[:session][:password])
		#Ingreso al usuario y lo redicciona a la pagina a la pagina del mismo
		ingreso user
		redirect_to user
	else
		flash.now[:error]='Combinacion email/password invalida'
		render 'new'
	end

end

def destroy 
end

end
