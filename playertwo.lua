function p2Physics()
  if p2Right and p2action ~= "stun" and p2action ~= "mid" and p2action ~= "low" and p2action ~= "super" and p2action ~= "shield" and p2action ~= "shieldhit" then
    p2xa = acc
  elseif (p2Left) and p2action ~= "stun" and p2action ~= "mid" and p2action ~= "low" and p2action ~= "super" and p2action ~= "shield" and p2action ~= "shieldhit" then
    p2xa = acc * -1
  end
  if ((not (p2Left or p2Right) or ((p2Left) and p2Right)) or p2Down) and p2action~="stun" and not p2inair then
    p2xa = 0
  end

  if p2action == "jumpsquat" or p2action == "land" then
    p2xa = 0
  end

  if p2Down and (p2inair == false) then
    p2crouching = true
  else
    p2crouching = false
  end

  if p2Up and (p2inair == false) and p2action == "idle" then
    p2action = "jumpsquat"
    p2frame = 0
  end

  if not (p2action == "stun" and p2frame <= 10) then
    p2xv = p2xv + p2xa
    p2xv = p2xv * fric
    p2x = p2x + p2xv

    if p2Down and p2inair then
      p2yv = p2yv + 1.5*grav
    end

    p2yv = p2yv + grav
    p2y = p2y + p2yv
  end

  if p2y > 0 and (p2action == "jump" or p2action == "air")then
    p2y = 0
    p2frame = 0
    p2action = "land"
  end

  if p2y > 0 then
    p2y = 0
  end
end

function p2Logic()
  if p2action == "stun" then
    if p2frame == 20 then
      if p2y > 0 then
        p2action = "idle"
      else
        p2action = "jump"
      end
    end
  end

  if p2action == "shieldhit" then
    if p2frame == 20 then
      p2action = "idle"
    end
  end

  if p2action ~= "stun" then
    if p2action == "jumpsquat" then
      p2xa = 0
      if p2frame == jumpsquatlength then
        p2yv = jheight
        p2inair = true
        p2action = "jump"
      end
    end
    if p2action == "land" then
      p2xa = 0
      p2active = false
      if p2frame == landlength then
        p2inair = false
        p2action = "idle"
      end
    end
  end

  --moves
  if p2action == "idle" or p2action == "walk" then
    if p2Hit and p2Down then
      --low
      p2xa = 0
      p2action = "low"
      p2frame = 0
      kick:stop()
      kick:play()
    elseif p2Hit then
      --mid
      p2xa = 0
      p2action = "mid"
      p2frame = 0
      snare:stop()
      snare:play()
    end
    if p2Super then
      --super
      p2xa = 0
      p2action = "super"
      p2frame = 0
      kick:stop()
      kick:play()
    end
    if p2Shield then
      --sheld
      p2xa = 0
      p2action = "shield"
      p2frame = 0
      shield:stop()
      shield:play()
    end
  end
  if p2action == "jump" then
    if p2Hit then
      --air
      p2action = "air"
      p2frame = 0
      kick:stop()
      kick:play()
    end
  end

  --movelogic
  --air
  if p2action == "air" then
    if airlength == p2frame then
      p2active = true

    end
  end
  --low
  if p2action == "low" then
    if p2frame == 8 then
      p2active = true
    end
    if p2frame == (lowlength)-2 then
      p2active = false
    end

    if p2frame == lowlength then
      p2action = "idle"
    end
  end
  --mid
  if p2action == "mid" then
    if p2frame == 7 then
      p2active = true
    end
    if p2frame == (midlength)-2 then
      p2active = false
    end

    if p2frame == midlength then
      p2action = "idle"
    end
  end
  --special
  if p2action == "super" then
    if p2frame == 15 then
      p2active = true
    end
    if p2frame == (superlength)-15 then
      p2active = false
    end

    if p2frame == superlength then
      p2action = "idle"
    end
  end
  --block
  if p2action == "shield" then
    if p2frame == 0 then
      p2invincible = true
    end
    if p2frame >= 25 then
      p2invincible = false
    end
    if p2frame == (shieldlength) then
      p2action = "idle"
    end
  end
end

function p2StunCheck()
  if p2active == true then
    if p2action == "low" and isIn(1, p2x-lowx, p2y) then
      if p1invincible == false then
        lowstunp1()
        p2active = false
        smallhit:stop()
        smallhit:play()
        p1health = p1health -.5
      else
        shieldstunp2()
        p1invincible = false
        p1action = "shieldhit"
        p1frame = 0
      end
    end
    if p2action == "mid" and isIn(1, p2x-midx, p2y-midy) then
      if p1invincible == false then
        stunp1()
        p2active = false
        midhit:stop()
        midhit:play()
        p1health = p1health -1
      else
        shieldstunp2()
        p1invincible = false
        p1action = "shieldhit"
        p1frame = 0
      end
    end
    if p2action == "super" and isIn(1, p2x-superx, p2y-supery) then
      if p1invincible == false then
        stunp1()
        p2active = false
        bighit:stop()
        bighit:play()
        p1health = p1health - 2
      else
        shieldstunp2()
        p1invincible = false
        p1action = "shieldhit"
        p1frame = 0
      end
    end
    if p2action == "air" and isIn(1, p2x-airx, p2y-airy) then
      if p1invincible == false then
        stunp1()
        p2active = false
        smallhit:stop()
        smallhit:play()
        p1health = p1health -.5
      else
        shieldstunp2()
        p1invincible = false
        p1action = "shieldhit"
        p1frame = 0
      end
    end
  end
end

function stunp2()
  p2active = false
  p2action = "stun"
  p2yv = kb*-1.3
  p2xa = acc/3
  p2xv = 20
  p2frame = 0
end

function lowstunp2()
  p2active = false
  p2action = "stun"
  p2yv = kb*-2.5
  p2xa = acc/4
  p2xv = 3
  p2frame = 0
end

function shieldstunp2()
  midhit:stop()
  midhit:play()
  p2active = false
  p2action = "stun"
  p2yv = kb*-2.5
  p2xa = acc/2
  p2xv = 40
  p2frame = 0
  p2health = p2health -.5
end
