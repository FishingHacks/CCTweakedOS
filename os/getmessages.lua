function a(id)
local b = 5-string.len(id)
local c = ""
for i=1,b do
c=c.."0"
end
return c..id
end

function getnotifics()
m = peripheral.find("modem")
m.open(2)
m.transmit(2,2,"ftc"..a(os.getComputerID()))
repeat
event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
--print(message)
until channel==2 and string.sub(message, 1, 3)=="sfc"
return string.sub(message, 9)
end
