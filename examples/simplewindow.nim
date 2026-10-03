# This example creates an SDL window and renderer.
#
# This code is public domain. Feel free to use it for any purpose!
# 
# Code adapted from Transmutrix' examples https://github.com/transmutrix/nim-sdl3/blob/main/examples

import ../src/sdl3

var
  screenwidth: cint = 800 # The type 'cint' is declared so there is no need to convert from Nim's int to C's int
  screenheight: cint = 600
  window: Window
  renderer: Renderer
  quit: bool

# To conform with Nim naming standards, the SDL_ prefix was dropped from every function, constant and variable

discard setAppMetadata("Simple Basic Window", "1.0", "com.example.basicwindow")

if not init(INIT_VIDEO):
  echo "Couldn't initialize SDL: ", getError()
  quit(QuitFailure)

# The 4th parameter are WindowFlags*, which can be passed as a sum of the flags (WINDOW_RESIZABLE + WINDOW_MAXIMIZED)
# or with the 'or' operator (WINDOW_RESIZABLE or WINDOW_MAXIMIZED)
# See sdl3.nim '# WindowFlags* {.size: sizeof(uint64).} = enum' for the full list
window = createWindow("Simple Window", screenwidth, screenheight, 0) 
# The 2nd parameter is a string. Accepted values are 'direct3d11, direct3d12, direct3d, opengl, opengles2, vulkan, gpu, software'
# You can get a list of valid render drivers with 'getRenderDriver(0 through 7)'
# When 'nil', will default to the best renderer available on the platform
renderer = createRenderer(window, nil)

# Main loop
while not quit:
  var event: Event
  while pollEvent(event):
    if event.type == EVENT_QUIT:
      quit = true

  # As you can see from this, rendering draws over whatever was drawn before it.
  assert setRenderDrawColor(renderer, 40, 70, 40, 255)  # r,g,b,a color values, from 0 to 255.
  assert renderClear(renderer)  # start with a blank canvas.
  # Any further screen rendering happens here
  assert renderPresent(renderer)  # Put it all on the screen!

renderer.destroyRenderer() # can alternatively be called as destroyRenderer(renderer)
window.destroyWindow() # can alternatively be called as destroyWindow(window)
sdl3.quit() # must begin with 'sdl3.' as Nim already has a quit() function
