class PeopleController < ApplicationController
  def index1
    #http://localhost:3000/people/index
    @msg = "Person data"
    @data = Person.all
  end

  def show
    @msg = "Indexed data"
    @data = Person.find(params[:id])
  end
end
