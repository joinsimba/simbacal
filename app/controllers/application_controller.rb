class ApplicationController < ActionController::Base
  def testy
    User.find(1).testy(1)
  end
end
