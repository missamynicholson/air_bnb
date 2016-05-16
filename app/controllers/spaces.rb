class AirBnb < Sinatra::Base

  get "/" do
    redirect to "/spaces"
  end

  get "/spaces" do
    @spaces = Space.all(order: [:price.desc])
    erb :"spaces/index"
  end

  get "/spaces/new" do
    erb :"spaces/new"
  end

  post "/spaces" do
    space = Space.create(user: current_user,
                         name: params[:name],
                         description: params[:description],
                         price: params[:price])
    if space.id.nil?
      flash[:errors] = space.errors.full_messages
      redirect to "/spaces/new"
    else
      redirect to "/spaces"
    end
  end
end