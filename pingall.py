#!/usr/bin/env python

import commands
import re

class NetworkInterface():
    def __init__(self, name, ipAddress, netmask):
        self.name       = name
        self.ipAddress  = ipAddress
        self.netmask    = netmask

class PingAll():
    def __init__(self):
        interfaces = self.getInterfaces()
        ipList = []
        for interface in interfaces:
            ipList = ipList + self.getIPs(interface)
        self.mainLoop()

    def getInterfaces(self):
        splitString = commands.getoutput('ifconfig')
        splitString = re.split('\n',splitString)
        interfaces = []
        for line in splitString:
            if not (line == ''):
                if not (line[0] == ' '):
                    line = re.split(' ',line)
                    name = i[0]
                    interfaces.append(NetworkInterface(name,ipAddress))
                ipInfo = re.split('inet addr:',line)
                if(length(ipInfo) > 1):
                    ipInfo = re.split(' ',ipInfo)
                    ipAddress
                    
#        print interfaces

    def getIPs(self):
        pass

    def mainLoop(self):
        pass


if __name__ == '__main__':
    pingAllObj = PingAll()
    pingAllObj.main()
    
