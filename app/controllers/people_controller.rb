class PeopleController < ApplicationController
  def index1
    #http://localhost:3000/people/index1 
    @msg = "Person data"
    @data = Person.all
  end

  def index2
    #http://localhost:3000/people/index2
    @msg = "Person data"
    @data = Person.all
  end

  def index3
    #http://localhost:3000/people/index3
    @msg = "Person data"
    @data = Person.all
  end

  def show
    @msg = "Indexed data"
    @data = Person.find(params[:id])
  end

  def add
    @msg = "add new data."
  end

  def add1
    #http://localhost:3000/people/add1 
    @msg = "add new data1."
  end

  def add2
    #http://localhost:3000/people/add2
    @msg = "add new data1."
    @person = Person.new
  end

  def create1
    if request.post? 
      obj = Person.create(
        name: params["name"],
        age:  params["age"],
        mail:  params["mail"],
        )
      end
      redirect_to("/people/index1")
  end

  def create2
    if request.post? 
      Person.create(person_params())
      end
      redirect_to("/people/index1")
  end

  

  def edit
    @msg = "edit data.[id = #{params[:id]}]"
    @person = Person.find(params[:id])
  end

  def update
    obj = Person.find(params[:id])
    obj.update(person_params)
    redirect_to("/people/index2")
  end

  def delete
    obj = Person.find(params[:id])
    obj.destroy()
    redirect_to("/people/index3")
  end


  private
  def person_params
    return params.require(:person).permit(:name, :age, :mail)
  end

end
