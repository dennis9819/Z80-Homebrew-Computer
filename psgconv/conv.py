inFile = "C:\\Users\\dg\\Desktop\\Z80\\psgconv\\Illusion.psg_.PSG"
outFile = "C:\\Users\\dg\\Desktop\\Z80\\psgconv\\song.s"

byteCounter = 0
maxBytes=4096
colCounter = 0
outFileS = open(outFile, 'w')


outFileS.writelines("song_demo2:\n")

with open(inFile, 'rb') as f:
    f.read(16)  # skip first 16 bytes

    lineArray = []

    while 1:
        byte_s = f.read(1)
        if not byte_s:
            break
        byte = byte_s[0]

        lineArray.append(hex(byte))
        byteCounter+= 1
        colCounter+=1
        if colCounter == 16:
            colCounter = 0
            outFileS.writelines("   db " + ','.join(lineArray)+"\n")

            lineArray = []
        if byteCounter==maxBytes:
            outFileS.writelines("   db 0xF0\n")
            outFileS.writelines("   ;EOF")
            exit(0)

while 1:
    continue
