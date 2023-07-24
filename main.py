import time
from pymodbus.client import ModbusSerialClient

# Define the Modbus client
client = ModbusSerialClient(method='rtu', port='COM7', baudrate=9600, timeout=1)
parameters = open("parameters.txt","r");
# Define the Modbus address of the frequency register
frequency_address = 0x2001
motor_address = 0x2000
# Define the initial frequency and the frequency step
frequency = int(parameters.readline())
frequency_step = int(parameters.readline())
delaytime = int(parameters.readline())
# Define the maximum frequency
max_frequency = int(parameters.readline())

# Connect to the Modbus device
client.connect()
client.write_register(motor_address, int(2), unit=1)
# Loop to increase the frequency up to a certain value
while frequency < max_frequency:
    # Write the frequency to the frequency register
    client.write_register(frequency_address, int(frequency * 10), unit=1)

    print((frequency))

    # Wait for 30 seconds before increasing the frequency again
    time.sleep(delaytime)

    # Increase the frequency by the frequency step
    frequency += frequency_step

# Disconnect from the Modbus device
client.close()
