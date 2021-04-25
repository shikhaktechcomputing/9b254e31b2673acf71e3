class ToyRobot

  def self.calculate(input)
  	movements = input.upcase.split("\\N")
  	position = "00NORTH"
  	position = movements.first.gsub("PLACE ","").gsub(",","").gsub(" ","") if movements.first.start_with?("PLACE ")
		robot = ToyRobotCalculator.new(position[0].to_i, position[1].to_i, position[2..-1].upcase)
		movements[1..-2].each do |movement|
			robot.get_command(movement)
		end
		return "#{robot.position_x},#{robot.position_y},#{robot.direction}" if movements.last.start_with?("REPORT")
		return ""
  end
end
