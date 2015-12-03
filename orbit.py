from visual import *

scene.autoscale=0
scene.range=2

#Giant is the star, dwarf is the planet, and moon is the - well - moon.
giant = sphere()
giant.pos = vector(0,0,0)
giant.radius = 0.1 ; giant.color = color.red
giant.mass = 2
giant.p = vector(0,0,0)

dwarf = sphere()
dwarf.pos = vector(1.5,0,0)
dwarf.radius = 0.04 ; dwarf.color = color.yellow
dwarf.mass = 0.001
dwarf.p = vector(0,1,0) * dwarf.mass

moon = sphere()
moon.pos = vector(1.53,0,0)
moon.radius = 0.02 ; moon.color = color.green
moon.mass = 0.000000001
#0.9 will cause the object to eject after a few orbits
#1.1 is stable, at least for the current dt
moon.p = vector(0,0.90,0)*moon.mass

## tweak initial condition so that total momentum is zero
giant.p -= moon.p

## create 'curve' objects showing where we've been
for a in [giant, dwarf, moon]:
  a.orbit = curve(color=a.color, radius = 0.01)


def pstep( giant, dwarf ): 
  dist = dwarf.pos - giant.pos
  force = G * giant.mass * dwarf.mass * dist / mag(dist)**3
  giant.p = giant.p + force*dt
  dwarf.p = dwarf.p - force*dt
  dist = dwarf.pos - giant.pos

#if this is increased, the object will eject right away
dt = 0.005
G = 1 
while 1:
  ## set the picture update rate (100 times per second)
  rate(100)

  pstep( giant, dwarf )
  pstep( giant, moon )
  pstep( moon, dwarf )

  for a in [giant, dwarf, moon]:
    a.pos = a.pos + a.p/a.mass * dt
    a.orbit.append(pos=a.pos)
