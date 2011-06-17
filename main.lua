require "os"
require "algos"
require "sensor"

function main()
	
	config["maxspeed"] = sensor.read("max")	
	while(true) do
		speed = algorithm[config["algorithm"]]()
		print("Temperature: " .. sensor.read("die sensor")/1000 )
		os.execute("sleep " .. config["updaterate"])
	end
end

main()
