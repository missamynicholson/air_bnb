class AirBnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, "super secret"
  set :partial_template_engine, :erb

  set :static, true
  set :public_folder, "public"

  enable :partial_underscores


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
