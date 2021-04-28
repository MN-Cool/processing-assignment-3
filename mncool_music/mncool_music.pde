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
float y = 0;

void setup()
{
  size(500, 500);
  colorMode(HSB);
  minim = new Minim(this);
  player = minim.loadFile("music.mp3", width);
  buffer = player.mix;
  
  lerpedBuffer = new float[buffer.size()];
}

int which = 0;

void draw()
{
  background(0);
  float halfHeight = height / 2;
  
  if (which == 0)
  {
    strokeWeight(1);
    for (int i = 0; i < buffer.size(); i ++)
    {
      float sample = buffer.get(i) * halfHeight;
      sample = lerpedBuffer[i] * width * 2;
      stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
      line(i, halfHeight + sample, i, halfHeight - sample);
      
      lerpedBuffer[i] = lerp(lerpedBuffer[i], buffer.get(i), 0.1f);
    }
  }
  
  if (which == 1)
  {
    strokeWeight(1);
    for (int i = 0; i < buffer.size(); i ++)
    {
      float sample = buffer.get(i) * halfHeight;
      sample = lerpedBuffer[i] * width * 2;
      stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
      line(i, i, halfHeight - sample, i);
      line(i, halfHeight + sample, i, i);
      
      lerpedBuffer[i] = lerp(lerpedBuffer[i], buffer.get(i), 0.1f);
    }
  }
  
  if (which == 2)
  {
    for (int i = 0; i < buffer.size(); i ++)
    {
      float c = map(i, 0, buffer.size(), 0, 255);
      stroke(c, 255, 255);
      float sample = buffer.get(i) * halfHeight;
      ellipse(i, halfHeight + sample, i, y);
    }
  }
  
  float sum = 0;
  for (int i = 0; i < buffer.size(); i ++)
  {
    sum += abs(buffer.get(i));
  }

  noStroke();
  fill(map(lerpedAverage, 0, 1, 0, 255), 255, 255);
  float average = sum / buffer.size();
  lerpedAverage = lerp(lerpedAverage, average, 0.1f);
  
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
    for (int i = 0; i < buffer.size(); i ++)
    {
      float sample = buffer.get(i) * halfHeight;
      sample = lerpedBuffer[i] * width * 2; 
      lerpedBuffer[i] = lerp(lerpedBuffer[i], buffer.get(i), 0.1f);
 
      stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
      line(width/2, i, width/2 - sample, i); 
      line(i, halfHeight, i, halfHeight - sample);
    }
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
