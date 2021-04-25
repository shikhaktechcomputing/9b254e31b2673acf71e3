##
# This class is to calculate the Robot movements.

class ToyRobotCalculator

  # All constants in order to customize if necessary
  TURN = {"LEFT" => -90, "RIGHT" => 90}
  DIRECTION = {"NORTH" => 0, "EAST" => 90, "SOUTH" => 180, "WEST" => 270}
  DIRECTION_COORDINATES = {
    "NORTH" => [0, 1], 
    "EAST" => [1, 0], 
    "SOUTH" => [0, -1], 
    "WEST" => [-1, 0]
  }
  MOVE_COMMAND = "MOVE"

  attr_accessor :position_x, :position_y
  attr_accessor :direction
  
  # Lets start this robot
  def initialize(position_x = 0, position_y = 0, direction = 'NORTH')
    validate_robot_position(position_x, position_y)
    validate_robot_direction(direction)
    @position_x, @position_y = position_x, position_y
    @direction = direction
    set_robot_direction
  end
  
  # All the robot movements
  def rotate(turn)
    current_direction_value = DIRECTION[@direction]
    turn_value = TURN[turn]
    @new_direction_value = current_direction_value + turn_value
    check_limits
    @direction = DIRECTION.key(@new_direction_value)
  end

  def move(displacement_x, displacement_y)
    set_robot_direction
    @position_x = @position_x + displacement_x * @direction_x
    @position_y = @position_y + displacement_y * @direction_y
  end
  
  def get_command(command)
    validate_robot_command(command)
    rotate(command) and return if TURN.keys.include?(command)
    move(1, 1) and return if command == MOVE_COMMAND
  end  

  private

	  def check_limits
	    @new_direction_value = 270 if @new_direction_value < 0
	    @new_direction_value = 0 if @new_direction_value > 270
	  end

	  def set_robot_direction
	    @direction_x = DIRECTION_COORDINATES[@direction][0]
	    @direction_y = DIRECTION_COORDINATES[@direction][1]
	  end

	  def validate_robot_position(position_x, position_y)
	    unless position_x.is_a?(Integer) || position_x.is_a?(Integer) 
	      raise "Position is not a number"
	    end
	  end

	  def validate_robot_direction(direction)
	    unless DIRECTION.keys.include?(direction) 
	      raise "Direction is not valid"
	    end
	  end

	  def validate_robot_command(command)
	    unless (TURN.keys + [MOVE_COMMAND]).include?(command) 
	      raise "Command is not valid"
	    end
	  end

end
