from PIL import Image
from PIL import ImageDraw
import colorsys
import sys
def mandelbrot(size,iterMax,zoom,xOffset, yOffset, image):
  """
  Generates a Mandelbrot Set
  """
  for x in range(size):
    for y in range(size):
      i,k = (-0.5 + xOffset + (4.0/zoom) * float(x-size/2) / size, yOffset + (4.0/zoom) * float(y - size / 2)/size)
      a,b = (0.0, 0.0)
      iterNum = -1.0
      while(a**2 + b**2<= 4 and iterNum < iterMax):
        a,b = (a**2-b**2+i, 2*a*b+k)
        iterNum += 1.0
        opacity = int(iterNum/iterMax * 255)
        """
        //CSH//
        """
        if iterNum == iterMax:
          ImageDraw.Draw(image).point((x,y), (0,0,0))
        else:
          ImageDraw.Draw(image).point((x,y),(0,0,0,opacity))
def makeFractal(size, iterMax, zoom, xO, yO):
  image = Image.new("RGBA", (size, size))
  print("Working...")
  mandelbrot(size, iterMax, zoom, xO, yO, image)
  image.save(("mandelbrot.png"), "PNG")
  print("mandelbrot.png saved.")
def main():
  size = int(raw_input("Image size:"))
  iterMax = float(raw_input("# of iterations:"))
  zoom = float(input("Zoom level:"))
  xO = float(input("X offset:"))
  yO = float(input("Y offset:"))
  makeFractal(size, iterMax, zoom, xO, yO)
main()
