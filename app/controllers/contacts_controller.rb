class ContactsController < ApplicationController
  def new
    # Nothing to do here yet
  end

  def create
    # We will implement email sending here in the future
    # For now, just redirect to a thank you page or back to the form
    redirect_to root_path, notice: "Your message has been sent!"
  end

end
