# This example creates an SDL window and renderer.
#
# This code is public domain. Feel free to use it for any purpose!
# 
# Code adapted from Transmutrix' examples https://github.com/transmutrix/nim-sdl3/blob/main/examples
# This code will create a window, fill it with points, draw some lines and draw some rectangles

import ../src/sdl3
import std/random

var
  screenwidth: cint = 800 # The type 'cint' is declared so there is no need to convert from Nim's int to C's int
  screenheight: cint = 600
  window: Window
  renderer: Renderer
  quit: bool
  points: array[500, FPoint]

discard setAppMetadata("Primitives", "1.0", "com.example.primitives")

if not init(INIT_VIDEO):
  echo "Couldn't initialize SDL: ", getError()
  quit(QuitFailure)
  
# The 3rd parameter is for WindowFlags*. Creating a Window and Renderer this way will always default to the 'nil', preferred renderer
if not createWindowAndRenderer("Primitives", screenwidth, screenheight, 0, window, renderer):
  echo "Couldn't create window/renderer: ", getError()
  quit(QuitFailure)

# When using Nim's std/random for random values, calling 'randomize()' is needed to ensure that results will be random
# A seed can also be passed as a parameter
randomize() 

# Set up random points
for i in 0..<points.len():
  points[i].x = rand(10.0..790.0)
  points[i].y = rand(10.0..790.0)

# Main loop
while not quit:
  var event: Event
  while pollEvent(event):
    if event.type == EVENT_QUIT:
      quit = true

  # Any function that receives 'renderer' as the first parameter can also be called like this:
  # 'renderer.renderFunction()', without passing it as the first parameter.
  assert setRenderDrawColor(renderer, 20, 40, 30, 255)  # r,g,b,a color values, from 0 to 255.
  assert renderClear(renderer)  # start with a blank canvas.
  
  assert setRenderDrawColor(renderer, 240, 240, 40, 255)  # r,g,b,a color values, from 0 to 255.
  assert renderPoints(renderer, points)
  
  var rect: FRect = FRect(x: 80, y: 80, w: 600, h: 400)
  assert setRenderDrawColor(renderer, 20, 100, 200, 255)  # r,g,b,a color values, from 0 to 255.
  assert renderFillRect(renderer, rect) # Filled color rectangle
  
  rect.x += 50
  rect.y += 50
  rect.w -= 100
  rect.h -= 100
  assert setRenderDrawColor(renderer, 220, 180, 100, 255)  # r,g,b,a color values, from 0 to 255.
  assert renderRect(renderer, rect) # Outlined rectangle
  
  assert setRenderDrawColor(renderer, 240, 250, 200, 255)  # r,g,b,a color values, from 0 to 255.
  assert renderer.renderLine(0,0, screenwidth.float, screenheight.float)
  assert renderer.renderLine(screenwidth.float, 0, 0, screenheight.float)
  
  assert renderPresent(renderer)  # Put it all on the screen!

renderer.destroyRenderer() #can alternatively be called as destroyRenderer(renderer)
window.destroyWindow() #can alternatively be called as destroyWindow(window)
sdl3.quit() #must begin with 'sdl3.' as has a quit() function
