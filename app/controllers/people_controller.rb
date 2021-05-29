class PeopleController < ApplicationController
  layout "people"
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

  def index4
    #http://localhost:3000/people/index4
    @msg = "Person data"
    @data = Person.all
  end

  def index5
    #http://localhost:3000/people/index5
    @msg = "Person data"
    @data = Person.all
  end

  def show
    @msg = "Indexed data"
    @data = Person.find(params[:id])
  end

  def show2
    #http://localhost:3000/people/index4 から
    @msg = "Indexed data"
    @data = Person.find(params[:id])
  end

  def show3
    #http://localhost:3000/people/index5 から
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

  def add3
    #http://localhost:3000/people/add3
    @msg = "add new data1."
    @person = Person.new
  end

  def add4
    #http://localhost:3000/people/add4
    @msg = "add new data1."
    @person = Person.new
  end

  def add5
    #http://localhost:3000/people/add5
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

  def create3
    @person = Person.new(person_params())
    if @person.save()
      redirect_to("/people/index3")
    else
      @msg = "入力に問題あり"
      render "add3"
    end
  end
  
  def create4
    @person = Person.new(person_params())
    if @person.save()
      redirect_to("/people/index4")
    else
      res = ""
      @person.errors.messages.each do |key, vals|
        vals.each do |val|
          res += "<span style=\"color:red\"> #{key.to_s} </span> #{val} <br>"
        end
      end
      @msg = res.html_safe()
      render("add4")
    end
  end

  def create5
    @person = Person.new(person_params())
    if @person.save()
      redirect_to("/people/index4")
    else
      render("add5")
    end
    
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

  def find1
    @msg = "please type search word"
    @people = Array.new
    if request.post?
      obj = Person.find(params["find"])
      @people.push(obj)
    end
  end

  def find2
    @msg = "please type search word"
    @people = Array.new
    if request.post?
      @people = Person.where( "age >= ?", params["find"])
    end
  end

  def find3
    @msg = "please type search word"
    @people = Array.new
    if request.post?
      @people = Person.where( "mail like ?", "%#{params["find"]}%")
    end
  end

  def find4
    @msg = "please type search word"
    @people = Array.new
    if request.post?
      f = params[:find].split(",")
      @people = Person.find(f)
    end
  end

  def find5
    @msg = "please type search word"
    @people = Array.new
    if request.post?
      @people = Person.where( "mail like ?", "%#{params["find"]}%").order("age asc")
    end
  end

  def find6
    @msg = "\"表示数, データの先頭位置\" の形式で入力"
    @people = Array.new
    if request.post?
      @people = Person.all.limit(f[0]).offset(f[1])
    end
  end

  private
  def person_params
    return params.require(:person).permit(:name, :age, :mail)
  end

end
