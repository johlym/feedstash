class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:body]
      ContactMailer.contact(name, email, body).deliver

      flash[:success] = "Message sent."
      redirect_to contact_path
    else
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to contact_path
    end
  end
  
  private
  
    def contact_params
      params.require(:contact).permit(:name, :email, :body)
    end
end
