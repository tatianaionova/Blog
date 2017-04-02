class PersonsController < ApplicationController
  def profile
  end
  def edit
    @person = Persons.find(params[:id])
  end
end
