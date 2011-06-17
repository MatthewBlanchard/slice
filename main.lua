require "os"
require "algos"
require "sensor"

function main()	
	while(true) do
		speed = algorithm[config["algorithm"]]()
		print("Temperature: " .. sensor.read("die sensor")/1000 )
		print("Fan speed: " .. speed )
		os.execute("sleep " .. config["updaterate"])
	end
end

main()
