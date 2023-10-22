using ACME
using WAV

fuzz = @circuit begin
    vIn = voltagesource()
    vcc = voltagesource(-9)
    vout = voltageprobe()
    gnd = voltagesource(0)
    c1 = capacitor(2.2-6)
    c2 = capacitor(20e-6)
    c1 = capacitor(0.01e-6)
    r1 = resistor(33e3)
    r2 = resistor(470)
    r3 = resistor(8.2e3)
    r4 = resistor(100e3)
    r5 = resistor(1e3) # potentiometer
    r6 = resistor(500e3) # measure the voltage across this for the output
    q1 = bjt(:npn) # I won't bother making these just like the originals
    q2 = bjt(:npn)

end
