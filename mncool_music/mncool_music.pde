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
  
  float sum = 0;
  for (int i = 0; i < buffer.size(); i ++)
  {
    sum += abs(buffer.get(i));
  }

  noStroke();
  fill(map(lerpedAverage, 0, 1, 0, 255), 255, 255);
  float average = sum / buffer.size();
  lerpedAverage = lerp(lerpedAverage, average, 0.1f);
  
  if (which == 0)
  {
    
  }
  
  if (which == 1)
  {
    
  }
  
  if (which == 2)
  {
    
  }
  
  if (which == 3)
  {
    
  }
  
  if (which == 4)
  {
    
  }
  
  if (which == 5)
  {
    
  }
  if (which == 6)
  {
    
  }
  
  if (which == 7)
  {
    
  }
  
  if (which == 8)
  {
    
  }
  
  if (which == 9)
  {
    
  }
}

void keyPressed()
{
  if (keyCode >= '0' && keyCode <= '9')
  {
    which = keyCode - '0';
  }
  if (keyCode == ' ')
  {
    if ( player.isPlaying() )
    {
      player.pause();
    }
    else
    {
      player.rewind();
      player.play();
    }
  }
}
