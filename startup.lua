term.clear()
write("Do you wanna install newOS? [y/n] ")
if string.sub(read(),1,1)=="y" then
shell.run("cp /disk/os/ /os/")
shell.run("cp /disk/tmp/startup.lua /startup.lua")
end
peripheral.find("drive").ejectDisk()
os.reboot()
