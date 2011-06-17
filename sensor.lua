require "io"
require "math"
require "algos"
require "config"
require "sensorinfo"

sensor = sensorinfo [config["model"][1]] [config["model"][2]]

function sensor.fanSpeed( speed )
	if not speed then return sensor.read("fan sensor") end
	speed = algorithm.clamp(speed, config["minspeed"], config["maxspeed"])
	print("Fan speed: " .. speed)
	fanfile = io.open(sensor["base"] .. sensor["out"], "w")
	if not fanfile then return nil end
	fanfile:write(speed)
	fanfile:close()
end

function sensor.read( name )
	sensorfile = io.open(sensor["base"] .. sensor[name])
	if not sensorfile then return nil end

	result = tonumber(sensorfile:read("*l"))
	sensorfile:close()
	return result
end
