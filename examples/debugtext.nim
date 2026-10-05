# This example creates an SDL window and renderer.
#
# This code is public domain. Feel free to use it for any purpose!
# 
# Code adapted from Transmutrix' examples https://github.com/transmutrix/nim-sdl3/blob/main/examples
# This code shows how to draw debugging text on screen

import ../src/sdl3

var
  screenwidth: cint = 800
  screenheight: cint = 600
  window: Window
  renderer: Renderer
  quit: bool

discard setAppMetadata("Debug Text", "1.0", "com.example.debugtext")

if not init(INIT_VIDEO):
  echo "Couldn't initialize SDL: ", getError()
  quit(QuitFailure)
  
# The 3rd parameter is for WindowFlags*. Creating a Window and Renderer this way will always default to the 'nil', preferred renderer
if not createWindowAndRenderer("Debug Text", screenwidth, screenheight, 0, window, renderer):
  echo "Couldn't create window/renderer: ", getError()
  quit(QuitFailure)

# Main loop
while not quit:
  var event: Event
  while pollEvent(event):
    if event.type == EVENT_QUIT:
      quit = true

  assert setRenderDrawColor(renderer, 10, 10, 10, 255)
  assert renderClear(renderer)
  
  assert setRenderDrawColor(renderer, 210, 210, 210, 255)
  assert renderer.renderDebugText(30, 30, "Hello, Nim SDL3!")
  assert renderer.renderDebugText(30, 40, "Give at least 10 pixels of height between texts")
  
  assert setRenderDrawColor(renderer, 250, 250, 50, 255)
  assert renderer.renderDebugText(30, 70, "Different text colors also work!")
  
  assert setRenderDrawColor(renderer, 100, 250, 250, 255)
  assert renderer.setRenderScale(3,3)
  assert renderer.renderDebugText(3, 30, "This text is rendered in 3x scale")
  assert renderer.setRenderScale(1,1) # Important to scale back to default
  
  assert setRenderDrawColor(renderer, 250, 250, 250, 255)
  assert renderer.renderDebugText(30, 130, "Only ASCII characters are supported. Emojis ☺ are not 😔 ")
  
  assert setRenderDrawColor(renderer, 250, 150, 250, 255)
  assert renderer.renderDebugText(30, 160, "This window has been running for " & $(getTicks() div 1000) & " seconds")
  
  assert renderPresent(renderer)  # Put it all on the screen!

renderer.destroyRenderer() #can alternatively be called as destroyRenderer(renderer)
window.destroyWindow() #can alternatively be called as destroyWindow(window)
sdl3.quit() #must begin with 'sdl3.' as has a quit() function
