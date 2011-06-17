require "math"

algorithm = {}

function algorithm.clamp(num, min, max)
	if num > max then return max end
	if num < min then return min end
	return num
end

algorithm["linear"] = function()
	step = (config["maxspeed"] - config["minspeed"]) / (config["maxtemp"] - config["mintemp"])
	temp = sensor.read("die sensor") / 1000
	speed = config["minspeed"] + ((temp-config["mintemp"])*step)
	sensor.fanSpeed(speed)
	return speed
end

algorithm["mbpfand"] = function()
	temp = sensor.read("die sensor") / 1000
	return math.log(temp/40) / 0.3 * config["maxspeed"]	
end
