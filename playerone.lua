function p1Physics()
  if p1Right and p1action ~= "stun" and p1action ~= "mid" and p1action ~= "low" and p1action ~= "super" and p1action ~= "shield" and p1action ~= "shieldhit" then
    p1xa = acc
  elseif p1Left and p1action ~= "stun" and p1action ~= "mid" and p1action ~= "low" and p1action ~= "super" and p1action ~= "shield" and p1action ~= "shieldhit" then
    p1xa = acc * -1
  end
  if ((not (p1Left or p1Right) or (p1Left and p1Right)) or p1Down) and p1action~="stun" and not p1inair then
    p1xa = 0
  end

  if p1action == "jumpsquat" or p1action == "land" then
    p1xa = 0
  end

  if p1Down and (p1inair == false) then
    p1crouching = true
  else
    p1crouching = false
  end

  if p1Up and (p1inair == false) and p1action == "idle" then
    p1action = "jumpsquat"
    p1frame = 0
  end

  if not (p1action == "stun" and p1frame <= 10) then
    p1xv = p1xv + p1xa
    p1xv = p1xv * fric
    p1x = p1x + p1xv

    if p1Down and p1inair then
      p1yv = p1yv + 1.5*grav
    end

    p1yv = p1yv + grav
    p1y = p1y + p1yv
  end

  if p1y > 0 and (p1action == "jump" or p1action == "air") then
    p1y = 0
    p1frame = 0
    p1action = "land"
  end

  if p1y > 0 then
    p1y = 0
  end
end

function p1Logic()
  if p1action == "stun" then
    if p1frame == 20 then
      if p1y > 0 then
        p1action = "idle"
      else
        p1action = "jump"
      end
    end
  end

  if p1action == "shieldhit" then
    if p1frame == 20 then
      p1action = "idle"
    end
  end

  if p1action ~= "stun" then
    if p1action == "jumpsquat" then
      p1xa = 0
      if p1frame == jumpsquatlength then
        p1yv = jheight
        p1inair = true
        p1action = "jump"
      end
    end
    if p1action == "land" then
      p1xa = 0
      p1active = false
      if p1frame == landlength then
        p1inair = false
        p1action = "idle"
      end
    end
  end

  --moves
  if p1action == "idle" or p1action == "walk" then
    if p1Hit and p1Down then
      --low
      p1xa = 0
      p1action = "low"
      p1frame = 0
      kick:stop()
      kick:play()
    elseif p1Hit then
      --mid
      p1xa = 0
      p1action = "mid"
      p1frame = 0
      snare:stop()
      snare:play()
    end
    if p1Super then
      --super
      p1xa = 0
      p1action = "super"
      p1frame = 0
      kick:stop()
      kick:play()
    end
    if p1Shield then
      --sheld
      p1xa = 0
      p1action = "shield"
      p1frame = 0
      shield:stop()
      shield:play()
    end
  end
  if p1action == "jump" then
    if p1Hit then
      --air
      p1action = "air"
      p1frame = 0
      kick:stop()
      kick:play()
    end
  end

  --movelogic
  --air
  if p1action == "air" then
    if airlength == p1frame then
      p1active = true
    end
  end
  --low
  if p1action == "low" then
    if p1frame == 8 then
      p1active = true
    end
    if p1frame == (lowlength)-2 then
      p1active = false
    end

    if p1frame == lowlength then
      p1action = "idle"
    end
  end
  --mid
  if p1action == "mid" then
    if p1frame == 7 then
      p1active = true
    end
    if p1frame == (midlength)-2 then
      p1active = false
    end

    if p1frame == midlength then
      p1action = "idle"
    end
  end
  --special
  if p1action == "super" then
    if p1frame == 15 then
      p1active = true
    end
    if p1frame == (superlength)-15 then
      p1active = false
    end

    if p1frame == superlength then
      p1action = "idle"
    end
  end
  --block
  if p1action == "shield" then
    if p1frame == 0 then
      p1invincible = true
    end
    if p1frame >= 25 then
      p1invincible = false
    end
    if p1frame == (shieldlength) then
      p1action = "idle"
    end
  end
end

function p1StunCheck()
  if p1active == true then
    if p1action == "low" and isIn(2, p1x+lowx, p1y) then
      if p2invincible == false then
        lowstunp2()
        p1active = false
        smallhit:stop()
        smallhit:play()
        p2health = p2health -.5
      else
        shieldstunp1()
        p2invincible = false
        p2action = "shieldhit"
        p2frame = 0
      end
    end
    if p1action == "mid" and isIn(2, p1x+midx, p1y-midy) then
      if p2invincible == false then
        stunp2()
        p1active = false
        midhit:stop()
        midhit:play()
        p2health = p2health -1
      else
        shieldstunp1()
        p2invincible = false
        p2action = "shieldhit"
        p2frame = 0
      end
    end
    if p1action == "super" and isIn(2, p1x+superx, p1y-supery) then
      if p2invincible == false then
        stunp2()
        p1active = false
        bighit:stop()
        bighit:play()
        p2health = p2health -2
      else
        shieldstunp1()
        p2invincible = false
        p2action = "shieldhit"
        p2frame = 0
      end
    end
    if p1action == "air" and isIn(2, p1x+airx, p1y-airy) then
      if p2invincible == false then
        stunp2()
        p2health = p2health -.5
        p1active = false
        smallhit:stop()
        smallhit:play()
      else
        shieldstunp1()
        p2invincible = false
        p2action = "shieldhit"
        p2frame = 0
      end
    end
  end
end

function stunp1()
  p1active = false
  p1action = "stun"
  p1yv = kb*-1.3
  p1xa = acc/-3
  p1xv = -20
  p1frame = 0
end

function lowstunp1()
  p1active = false
  p1action = "stun"
  p1yv = kb*-2.5
  p1xa = acc/-4
  p1xv = -3
  p1frame = 0
end

function shieldstunp1()
  midhit:stop()
  midhit:play()
  p1active = false
  p1action = "stun"
  p1yv = kb*-2.5
  p1xa = acc/-2
  p1xv = -40
  p1frame = 0
  p1health = p1health -.5
end
