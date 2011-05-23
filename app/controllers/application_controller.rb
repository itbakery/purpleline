class ApplicationController < ActionController::Base
  protect_from_forgery
  def add_log
    #create new log
    log = ActivityLog.new
    # read data from request
    log.session_id = request.session_options[ :id]
    log.user_id = current_user.id
    log.browser = request.env['HTTP_USER_AGENT']
    log.ip_address = request.env['REMOTE_ADDR']
    log.controller = controller_name
    log.action = action_name
    log.request_at = Time.now
    # Save the log
    log.save
  end
end
