class ToyRobotController < ApplicationController
	skip_before_action  :verify_authenticity_token

  def test_with_get_method
    @input = "Undefined"
    @input = params[:input] if params.has_key?(:input)
    @result = "Undefined"
    @result = ToyRobot.calculate(@input) if @input != "Undefined"
  end

  def test_with_post_method
  	@input = "Undefined"
    @input = params[:input] if params.has_key?(:input)
    @result = "Undefined"
    @result = ToyRobot.calculate(@input) if @input != "Undefined"
    return render json: {status: 200, data: {attachments: @result}, message: "Success"}
  end
end
