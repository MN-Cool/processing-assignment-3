import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer player;
AudioBuffer buffer;
AudioInput ai;

float lerpedAverage = 0;

float[] lerpedBuffer;

float x = 0;

void setup()
{
  size(500, 500);
  colorMode(HSB);
  minim = new Minim(this);
  player = minim.loadFile("");
  buffer = player.mix;
  
  lerpedBuffer = new float[buffer.size()];
}

int which = 0;

void draw()
{
  background(0);
  float halfHeight = height / 2;
}

void keyPressed()
{
  
}
