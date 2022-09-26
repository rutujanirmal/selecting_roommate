class UsersController < ApplicationController

  def index
    data = decode()
    details = data[0]
    if details["emp_id"]
      current_user = User.find_by_emp_id(details["emp_id"])
      users = User.where(gender: current_user.gender, room_id: nil).where.not(emp_id: details["emp_id"]).pluck(:emp_id,:full_name)
      if users.present?
        render status: 200, json: users.to_json
      else
        render status: 400, json: {error: I18n.t('user.everyone_booked')}
      end
    else
      render status: 404, json: {message: I18n.t('session.invalid'), status_code: :unauthorized}  
    end
  end

  def user_details
    email_id = params[:email]
    if(email_id.match(EMAIL_REGEX))
      user_details = User.where(email: email_id).pluck(:emp_id,:full_name,:room_id,:role).first
      if(user_details.present?)
        payload = {
          emp_id: user_details[0]
        }
        token = encode(payload)
        if(user_details[2])
          room = Room.find(user_details[2])
          roommates = User.where(emp_id: room.roommates).pluck(:full_name)
          render status: 400, json: {error: I18n.t('room.already_booked'), roommates: roommates}
        else
          render status: 200 , json: {emp_id: user_details[0],full_name: user_details[1],token: token,role: user_details[3]}
        end
      else
        render status: 400 , json: {error: I18n.t('email.not_found')}
      end
    else
      render status: 400 , json: {error: I18n.t('email.not_valid')}
    end
  end

end
