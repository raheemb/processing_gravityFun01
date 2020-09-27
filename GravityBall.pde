// A GravityBall object is a particle that moves under the influence of a 
// gravitational force directed from its position to an anchor point. 
class GravityBall { 
  PVector anchor, pos, vel, acc, r;
  float rad;
  color c;
  float g = 0.05; // magnitude of the acceleration
  
  // Create a GravityBall object
  GravityBall (PVector anchor_, PVector pos_, PVector vel_, color c_, float rad_) {  
    anchor = new PVector(anchor_.x, anchor_.y); // location of gravitational center
    pos = new PVector(pos_.x, pos_.y);          // particle initial position
    r = PVector.sub(anchor, pos);               // vector from the position to the anchor
    vel = new PVector(vel_.x, vel_.y);          // particle initial velocity
    acc = new PVector(0,0);                     // initial acceleration
    c = c_;                                     // particle color
    rad = rad_;                                 // radius of the particle
  }
  
  void update() { 
    // Update the acceleration, velocity, and position at each time step
    PVector norm = r;
    norm.normalize();
    acc.set(g*norm.x/r.magSq(), g*norm.y/r.magSq());
    vel.set(vel.x+acc.x, vel.y+acc.y);
    pos.set(pos.x+vel.x, pos.y+vel.y);
    r = PVector.sub(anchor, pos);
    
    // Draw the particle in its updated position 
    noStroke();
    fill(c);
    ellipse(pos.x, pos.y, rad, rad);
  }
}
