class Api::V1::ApiController < ApplicationController
  include APITokenAuthenticable
  include APICommonErrors

  respond_to :json
end
