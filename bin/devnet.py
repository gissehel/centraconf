#!/usr/bin/env python

import time
import sys

def devnet(timespan=5,*argv) :
    start = time.time()
    with open('/proc/net/dev','rb') as handle :
        start_content = handle.read()
    time.sleep(float(timespan))
    stop = time.time() 
    with open('/proc/net/dev','rb') as handle :
        stop_content = handle.read()

    values = {}
    for id,content in (('start',start_content),('stop',stop_content)):
        values[id] = {}
        for line in content.split('\n') :
            if ':' in line :
                device, params = line.split(':',1)
                device = device.strip(" \r\n\t")
                values[id][device] = map(int,filter(len,params.strip(' \r\n\t').split(' ')))
    for device in values['stop'] :
        print "%-8s : %-15.2f %-15.2f" % (device,(values['stop'][device][0]-values['start'][device][0])/(1000.*(stop-start)),(values['stop'][device][8]-values['start'][device][8])/(1000.*(stop-start)))

if __name__ == '__main__' :
    devnet(*(sys.argv[1:]))
    
