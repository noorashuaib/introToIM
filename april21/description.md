**DYNAMIC AND STATIC INTERACTION**

I really loved the mesmerizing pattern in connectedLines with the light movement of the lines and the endless connections. I
wanted to make something that was interactive in both a dynamic and static way, so that once you started, the art continued,
but interaction would add another level of change. 

The code for gravity wind was a bit complicated, and I'd like to make more changes to see how much I could do with it, but for now, I combined the codes for connectedLines with the code for gravityWind, to use the ball as the mouse in the interactive art. I didn't want the ball to only push away the connected lines, however, so I changed the minimum distance from the ball to other lines so that it didn't push them away so much that some lines wouldn't connect with the ball. I then made the lines closest to the ball converge around it, so that the ball was perpetually connecting to the lines that were very close to the ball, but also pushing away the lines that were further around it. This made the ball have a more spasmodic connection with the lines around it, so that even if you didn't push any keys or move the mouse, the art kept moving. I also made the lines converge around the cursor so that there was both a dynamic interaction with the ball constantly moving the lines, and a static interaction with the mouse converging the lines, but staying constant if you didn't move it. 

![](alteredCode.jpg)
