require "io"
require "math"
require "config"
require "sensorinfo"

sensor = sensorinfo [config["model"][1]] [config["model"][2]]

function sensor.fanSpeed( speed )
	if not speed then return sensor.read("fan sensor") end
	if speed < config["minspeed"] then speed = config["minspeed"] end
	if speed > config["maxspeed"] then speed = config["maxspeed"] end
	
	fanfile = io.open(sensor["base"] .. sensor["out"], "w")
	if not fanfile then return nil end
	fanfile:write(speed)
	fanfile:close()
end

function sensor.read( name )
	sensorfile = io.open(sensor["base"] .. sensor[name])
	if not sensorfile then return nil end

	temp = tonumber(sensorfile:read("*l"))
	sensorfile:close()
	return temp/1000
end
