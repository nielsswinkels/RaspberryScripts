import pygame
import pygame.camera as pycamera
import time
from pygame.locals import *

size = (640, 480)
display = pygame.display.set_mode(size, 0)
snapshot = pygame.surface.Surface(size, 0, display)

pycamera.init()
cameras = pycamera.list_cameras()
if len(cameras) <= 0:
  print "No cameras detected."
  pygame.quit()
if len(cameras) == 1:
  print "Found 1 camera:"
else:
  print "Found "+len(cameras)+" cameras:"
for camera in cameras:
  print camera
cam = pycamera.Camera(cameras[0], size)
cam.start()

running = True
while running:
  events = pygame.event.get()
  for e in events:
    if e.type == QUIT or (e.type == KEYDOWN and e.key == K_ESCAPE):
      running = False
  img = cam.get_image(snapshot)
  display.blit(img, (0,0))
  pygame.display.flip()

cam.stop()
pycamera.quit()
