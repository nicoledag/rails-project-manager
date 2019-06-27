Rails.application.config.middleware.use OmniAuth::Builder do

provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end


#can use Figero gem and dotenv gem to hide keys
