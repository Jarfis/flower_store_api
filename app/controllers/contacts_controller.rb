class ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: {success: true, contacts: current_user.contacts}, status: 200
  end

  def create
    the_contact = Contact.new(contact_params)
    the_contact.user = current_user
    # the_contact.default = params[:default]
    current_user.contacts.update_all(default: false)
    the_contact.default = true


    if the_contact.save
      render json: {success: true, contact_id: the_contact.id}, status: 200
    else
      render json: {success: false}, status: 400
    end
  end

  def update

  end

  def destroy
    the_contact = Contact.where(user_id: current_user.id, id: params[:id])[0]

    if the_contact && the_contact.update_attributes(archived: true)
      render json: {success: true}, status: 200
    else
      render json: {success: false}, status: 400
    end
  end

  protected

  def contact_params
    params.permit(:name, :province, :city, :postal_code, :address, :phone)
  end
end