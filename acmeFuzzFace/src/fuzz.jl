using ACME

gain = 0.1
potValue = 1e3 * (1 - gain)

fuzz = @circuit begin
    vIn = voltagesource()
    vcc = voltagesource(9)
    vOut = voltageprobe()
    c1 = capacitor(2.2-6)
    c2 = capacitor(20e-6)
    c3 = capacitor(0.01e-6)
    r1 = resistor(33e3)
    r2 = resistor(470)
    r3 = resistor(8.2e3)
    r4 = resistor(100e3)
    pot1 = resistor(potValue) # sets the gain
    pot2 = resistor(500e3) # measure the voltage across this for the output
    q1 = bjt(:pnp) # I won't bother making these just like the originals
    q2 = bjt(:pnp)

    vcc[+] ↔ gnd
    vIn[+] ↔ c1[1]
    vIn[-] ↔ gnd
    c1[2] ↔ q1[base] ↔ r4[1]

    q1[collector] ↔ q2[base] ↔ r1[1] ↔ vcc[+]
    q1[emitter] ↔ gnd

    q2[collector] ↔ r3[1]
    r3[2] ↔ c3[1] ↔ r2[1]
    r2[2] ↔ vcc[+]

    r4[2] ↔ pot1[1] ↔ c2[1] ↔ q2[emitter]
    c2[2] ↔ gnd
    pot1[2] ↔ gnd
    
    c3[2] ↔ vOut[+] ↔ pot1[1]
    vOut[-] ↔ pot2[2] ↔ gnd
end


#=using WAV

audio = "audio/jazz.wav"
signal, frequency = wavread(audio)
signalLength = length(signal) # wow!

signal = reshape( signal, (signalLength) )=#
frequency = 44100

model = DiscreteModel(fuzz, 1/frequency)

#y = run!(model, signal)

y = run!(model, [sin(2π*1000/44100*n) for c in 1:1, n in 0:44099])

println(y)

#wavwrite(y, "fuzzed.wav", Fs=frequency)
