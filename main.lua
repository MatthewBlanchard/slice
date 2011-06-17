require "os"
require "sensor"

function main()

	lasttemp = 0
	increasecount = 0
	tempdif = config["maxtemp"] - config["mintemp"]
	speeddif = config["maxspeed"] - config["minspeed"]
	step = speeddif / tempdif 
	
	while(true) do
		os.execute("sleep 10")
		temp = sensor.read("die sensor")
		if temp > lasttemp then increasecount = increasecount + 1 end
		if temp < lasttemp then increasecount = increasecount - 1 end
		if increasecount < 0 then increasecount = 0 end
		if temp > config["maxtemp"] then
			speed = config["maxspeed"] 
		elseif temp > config["mintemp"] then
			speed = (1 + .2 * increasecount) * (config["minspeed"] + ((temp - config["mintemp"]) * step))
		else
			speed = config["minspeed"]
		end
		lasttemp = temp
		sensor.fanSpeed(speed)

		print(temp)
		print(speed)
		print(increasecount)
	end
end

main()
