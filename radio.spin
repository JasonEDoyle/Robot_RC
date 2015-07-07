CON
    _clkmode = xtal1 + pll16x
    _xinfreq = 5_000_000

    LCD_PIN = 1
    LCD_BAUD = 9_600
  
    CS = 13             ' ADC chip select pin
    DPIN = 14           ' ADC data in and out pins
    CPIN = 15           ' ADC clock pin
    MODE = $FF          ' set all pins to single inputs

VAR
    long up_down, left_right
                     
OBJ
  
    LCD : "SparkFun_Serial_LCD.spin"
    MCP : "MCP3008.spin"
    Serial : "FullDuplexSerial"
  
PUB Main

    ' Initializions
    MCP.start(DPIN, CPIN, CS, MODE)
    LCD.init(LCD_PIN, LCD_BAUD, 2, 16)
    Serial.start(31, 30, 0, 115200)
    
    
    
    repeat
        up_down := MCP.in(0)
        left_right := MCP.in(1)
        
        Serial.str(string( 10, 13, "Up down: " ))
        Serial.Dec(up_down)
        
        Serial.str(string( 10, 13, "Left right: " ))
        Serial.Dec(left_right)
        waitcnt(clkfreq + cnt)