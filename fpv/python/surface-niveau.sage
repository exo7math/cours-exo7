

var('x y z')

p = implicit_plot3d((x^2 + y^2 + z^2), (x,-2,2), (y,-2,2), (z,-2,2), plot_points=60, contour=[1,3,5], region=lambda x,y,z: x<=0.75 or y>=0.5 or z<=0.7, color='aliceblue')

p.show(viewer='tachyon',frame=false)

p.save('surface-niveau-1.png',frame=false)
