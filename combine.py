import time
from pymodbus.client import ModbusSerialClient
from datetime import datetime
from MEDAQLib import MEDAQLib, ME_SENSOR, ERR_CODE


# Define the Modbus client
client = ModbusSerialClient(method='rtu', port='COM6', baudrate=9600, timeout=1)
parameters = open("parameters.txt","r")
# Define the Modbus address of the frequency register
frequency_address = 0x2001
motor_address = 0x2000
temp = str(parameters.readline())
# Define the initial frequency and the frequency step
frequency = int(parameters.readline())
frequency_step = int(parameters.readline())
delaytime = int(parameters.readline())
# Define the maximum frequency
max_frequency = int(parameters.readline())

sampling_freq = int(parameters.readline())
EXPECTED_BLOCK_SIZE = int(parameters.readline())
# Connect to the Modbus device
client.connect()
client.write_register(motor_address, int(2), unit=1)

MEDAQLib_object = MEDAQLib.CreateSensorInstance(ME_SENSOR.SENSOR_ILD1420)

object2 = MEDAQLib.CreateSensorInstance(ME_SENSOR.SENSOR_ILD1420)

# Tell MEDAQLib about interface to be used
MEDAQLib_object.SetParameterString("IP_Interface", "IF2004_USB")
object2.SetParameterString("IP_Interface", "IF2004_USB")

MEDAQLib_object.SetParameterInt("IP_ChannelNumber", 2)
object2.SetParameterInt("IP_ChannelNumber", 0)

# Enable Logfile writing
MEDAQLib_object.SetParameterInt("IP_EnableLogging", 0)
MEDAQLib_object.SetParameterString("IP_LogFile", "log.txt")
# Try to open communication to sensor via interface specified
MEDAQLib_object.OpenSensor()
object2.OpenSensor()
iter = 0

MEDAQLib_object.SetDoubleExecSCmd("Set_Samplerate", "SP_Measrate", sampling_freq)

# h.write(str(MEDAQLib_object.ExecSCmdGetInt("Get_Samplerate", "SA_Measrate")))
object2.SetDoubleExecSCmd("Set_Samplerate", "SP_Measrate", sampling_freq)

# Loop to increase the frequency up to a certain value
while frequency <= max_frequency:

    # Write the frequency to the frequency register
    client.write_register(frequency_address, int(frequency * 10), unit=1)
    
    print(frequency)
    time.sleep(delaytime)
	
	#.....sensors...........
		

	
    
    # samplerate = 1 # 1KHz
    #
    # This is a very simple sample following MEDAQLib.pdf section 4 Using MEDAQLib
    #
    # Please adjust to your setup (interface card and sensor used)
    #

    

    # Expected TransferData block size (number of values transmitted in one go)


    f1 = open("sensordata_"+ str(frequency) + ".txt",'w')
    

    # Tell MEDAQLib about sensor type to be used


    MEDAQLib_object.SetIntExecSCmd("Clear_Buffers","SP_AllDevices",1)
    object2.SetIntExecSCmd("Clear_Buffers", "SP_AllDevices", 1)
    # If no error then try to acquire data
    if MEDAQLib_object.GetLastError() == ERR_CODE.ERR_NOERROR:

        bDone = False

        #while iter < 60*minutes*sampling_freq:
        while bDone is not True:


            # Check whether there's enough data to read in
            currently_available = MEDAQLib_object.DataAvail()
            #print(iter)
            # Check if DataAvail causes an Error
            if MEDAQLib_object.GetLastError() == ERR_CODE.ERR_NOERROR and currently_available > EXPECTED_BLOCK_SIZE and object2.DataAvail() > EXPECTED_BLOCK_SIZE:
                # Fetch data from MEDAQLib's internal buffer
                transfered_data = MEDAQLib_object.TransferData(EXPECTED_BLOCK_SIZE)
                data2 = object2.TransferData(EXPECTED_BLOCK_SIZE)
                bDone = True
                
                # Check if TransferData causes an error
                if MEDAQLib_object.GetLastError() == ERR_CODE.ERR_NOERROR:
                    # contains original values form sensor
                    raw_data = transfered_data[0]
                    # contains scaled data
                    scaled_data = transfered_data[1]
                    scaled_data2 = data2[1]

                    #print(*scaled_data, sep = "\n")
                    for (val1,val2) in zip(scaled_data,scaled_data2) :
                        f1.write(str(val1)+"\t" +str(val2) + "\n")
                    
                    # should be equal to gotBlockSize
                    nr_values_transfered = transfered_data[2]

                    # do your computation on data ....
                    #print(raw_data)

                else:
                    # Print TransferData error
                    print(MEDAQLib_object.GetError(1024))
            else:
                # Print DataAvail Error
                print(MEDAQLib_object.GetError(1024))

            # Sleep for 10 ms
            #time.sleep(1/sampling_freq)
            iter = iter + 1

    else:
        # Print OpenSensor Error
        print(MEDAQLib_object.GetError(1024))

    f1.close()
   


    # Closing down by closing interface and releasing sensor instance

    

    # Increase the frequency by the frequency step
    frequency += frequency_step

# Disconnect from the Modbus device
object2.CloseSensor()
object2.ReleaseSensorInstance()
MEDAQLib_object.CloseSensor()
MEDAQLib_object.ReleaseSensorInstance()
client.close()