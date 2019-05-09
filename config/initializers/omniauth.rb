Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '65162a0382ccc7676a64', 'a0e42f4047fe7068a1b61345e7b96d4300393768'
end


#can use Figero gem and dotenv gem to hide keys
