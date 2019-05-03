## General notes
This container provides a built of the ESP8266 SDK, obtained from [esp-open-sdk](https://github.com/pfalcon/esp-open-sdk).  
To build:  
`docker build -t snjix/esp8266-sdk:v1 .`  
This should take about 20 minutes to pull down all the dependencies and compile the sdk.  


## Usage notes
The SDK lives in `/sdk/sdk` and binaries are in `/sdk/xtensa-lx106-elf/bin` which is already in the PATH.  

Just `cd` to your code directory and run:  
```
docker run -it -v `pwd`:/code snjix/esp8266-sdk:v1
```
This will drop you in a terminal in which you can for example run `make` to compile your code.




