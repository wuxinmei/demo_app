class SessionsController < ApplicationController
	def new
		@title = "Sign In"
		end
	def create
	 	user=User.authenticate(params[:session][:email],params[:session],[:password])
		if user.nil?
			flash.now[:error] = "invalid email or password"
			@title="Sign In"
			render "new"
		else 

		end
	end
	def destroy
	end
end
