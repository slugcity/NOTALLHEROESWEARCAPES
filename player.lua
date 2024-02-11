--players

fric = .7
acc = 3
grav = 1.15
jheight = -18
kb = 5

sizex = 50
sizey = 175

jumpsquatlength = 5
landlength = 8
lowlength = 19
midlength = 34
airlength = 6
superlength = 40
shieldlength = 50

function playerPhysics()
  if (p1health <= 0 or p2health <= 0) and gameState=="play" then
    gameState="over"
    count = 0
  end

  if gameState=="play" then
    p1Physics()
    p1Logic()
    p2Physics()
    p2Logic()
    p1StunCheck()
    p2StunCheck()
  end

  pCol()
end

function pCol()
  if p1x < -350 then p1x = -350 end
  if p2x > 350 then p2x = 350 end

  if p2x < -350 then p2x = -350 end
  if p1x > 350 then p1x = 350 end

  if p2x-sizex <= p1x then
    p1x = p2x-sizex
    p2x = p1x+sizex+1
    if p1action~="stun" then
      p1xa = 0 p1xv = 0
    end
    if p2action~="stun" then
      p2xa = 0 p2xv = 0
    end
  end
  --if p1x+sizex >= p2x then  end
end
