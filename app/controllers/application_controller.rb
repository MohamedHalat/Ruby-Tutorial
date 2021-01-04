class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def hello
        render html: "Hß∂ƒ∂ßƒ©ello World"
    end
    
    def goodbye
        render html: "Bye World"
    end
end
