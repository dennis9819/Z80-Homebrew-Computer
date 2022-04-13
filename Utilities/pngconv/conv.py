from asyncio import current_task
from operator import or_
from PIL import Image

image_file= '/home/dennisgunia/Projects/Z80/Utilities/pngconv/Z8C.png'
out_file= '/home/dennisgunia/Projects/Z80/Utilities/pngconv/Z8C_tiles.s'
pattern_offset=0

outFileS = open(out_file, 'w')
im = Image.open(image_file, 'r')
pix_val = list(im.getdata())



width, height = im.size

def getPixelID(x,y):
    return x + (y*width)


tiles_x = int(width/8)
tiles_y = int(height/8)

if width % 8 > 0 or height % 8 > 0:
    raise Exception("Heigth and width must be multiple of 8")

print("Input picture:   %s" % (image_file,))
print("Input size:      %i x %i px" % (width,height))
print("Predicted Tiles: %i x %i (%i total)" % (tiles_x,tiles_y,(tiles_x*tiles_y)))
print("output:          %s" % (out_file,))

current_tile_id = pattern_offset



for tile_y in range (0,tiles_x):
    for tile_x in range (0,tiles_x):
        loc_x = tile_x*8
        loc_y = tile_y*8
        outFileS.writelines("tile_%i: ;(%i,%i)\n    db " % (current_tile_id,tile_x,tile_y))
        #print("-- new tile",tile_x,tile_y)
        for line_n in range(0,8):
            val = 0x00
            for px_n in range(0,8):
                pixel_index = getPixelID(loc_x+px_n,loc_y+line_n)
                #print(pixel_index,loc_x,loc_y,px_n,line_n)
                gray, alpha = pix_val[pixel_index]
                if gray == 0:
                    val = val | (1<<(7-px_n))
            outFileS.writelines("%i"%(val,))
            if line_n == 7:
                outFileS.writelines("\n")
            else:
                outFileS.writelines(",")
        
        
        current_tile_id += 1


#print (pix_val)