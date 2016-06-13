class ContactMailer < ApplicationMailer

	default from: "CartApp <testinglexcreed@gmail.com>"

	def contact_send(params) @parameters=params 
		mail(to:'testinglexcreed@gmail.com',subject:@parameters[:subject]) 
	end

end
