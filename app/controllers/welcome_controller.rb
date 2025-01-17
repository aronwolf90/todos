class WelcomeController < ApplicationController
  layout "homepage"
  allow_unauthenticated_access only: %i[ index ]

  def index
  end
end
