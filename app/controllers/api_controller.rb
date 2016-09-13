class ApiController < ActionController::Base
  before_filter :authenticate_company!
  respond_to :json

  private

  def authenticate_company!
    token = request.headers['Authorization']
    return render(json: {message: 'Missing Authorization Token'}, status: 422) if token.nil?

    secret = Base64.decode64(token.split(' ', 2).last || '').split(/:/, 2).first
    render(json: {message: 'Forbidden'}, status: 403) unless secret == 'msjrxlswsl'
  end
end
