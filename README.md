# processing_gravityFun01

An exploration in simulating gravity in processing. A video of the output is included in this repository. 

To generate your own videos, uncomment the line "saveFrame("frames/#######.png");" from the code. 
If you have ffmpeg installed from your terminal you can then use the command 
> ffmpeg -r 30 -i %07d.png -pix_fmt yuv420p -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" -vcodec libx264 out.mov

in the frames folder of your project to generate your own .mov file from the saved frames.

Have fun!

-RB
