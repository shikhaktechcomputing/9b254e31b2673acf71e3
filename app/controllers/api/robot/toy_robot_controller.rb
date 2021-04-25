class Api::Robot::ToyRobotController < ApplicationController
	skip_before_action  :verify_authenticity_token

  eval(IO.read('doc/api_doc/toy_robots/toy_robot_data.html'), binding)
  def toy_robot_data
  	@input = "Undefined"
    @input = params[:input] if params.has_key?(:input)
    @result = "Undefined"
    @result = ToyRobot.calculate(@input) if @input != "Undefined"
    return render json: {status: 200, data: {attachments: @result}, message: "Success"}
  end
end
