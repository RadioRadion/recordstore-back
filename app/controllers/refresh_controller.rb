class RefreshController < ApplicationController
before_action :authorize_access_request!

  def create
    session = JWTSessions::Session.new(payload: clamiless_payload, refresh_by_access_allowed: true)
    tokens = dession.refresh_by_access_allowed do
      raise JWTSessions::Errors::Unauthorized, "Something not right here!"
    end

      response.set_cookie(JWTSessions.access_cookie,
                          value: tokens[:access],
                          httponly: true,
                          secure: Rails.env.production? )
      render json: { csrf: tokens[:csrf] }
    else

  end

end
