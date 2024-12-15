class ContactsController < ApplicationController
  def new
<<<<<<< HEAD
    # Nothing to do here yet
  end

  def create
    # We will implement email sending here in the future
    # For now, just redirect to a thank you page or back to the form
    redirect_to root_path, notice: "Your message has been sent!"
  end

=======
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Thank you for reaching out!"
      redirect_to root_path
    else
      flash[:alert] = "There was a problem with your submission."
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
>>>>>>> 20b2a5b (Add contact page)
end
