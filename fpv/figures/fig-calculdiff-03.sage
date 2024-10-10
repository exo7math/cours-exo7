# Surface non différentiable
#load("fig-calculdiff-03.sage")

reset()

var('x,y')
f = abs(x+y)

from sage.plot.plot3d.plot3d import axes

G = plot3d(f,(x,-2,2),(y,-2,2), adaptive=True, color=rainbow(60, 'rgbtuple'), max_bend=.1, max_depth=15)
G = G + axes(3,1, color='black')

#GG = G.rotate((0,1,0),pi/8)
#GG = GG.rotate((0,0,1),pi/10)

G.show(aspect_ratio=1,frame=False)
#G.save('fig-calculdiff-03.png')


