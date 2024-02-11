function p1Render()

if p1action == "low" or p1action == "mid" or p1action == "air" then
  love.graphics.setColor(.92,.87,.60)
elseif p1action == "super" then
  love.graphics.setColor(.92,.73,.73)
elseif p1invincible then
  love.graphics.setColor(.7,.85,.92)
else
  love.graphics.setColor(1,1,1)
end

  if p1action == "idle" then
    if not p1crouching then
      if p1xa ~= 0 then
        if (0<=timer and timer <= 9) or (20<=timer and timer <= 29) or (40<=timer and timer <= 49) then
          love.graphics.draw(p1idle, p1x+half-sizex, p1y+asd-sizey)
        else
          love.graphics.draw(p1walk, p1x+half-sizex, p1y+asd-sizey)
        end
      else
        love.graphics.draw(p1idle, p1x+half-sizex, p1y+asd-sizey)
      end
    else
      love.graphics.draw(p1crouch, p1x+half-sizex, p1y+asd-sizey)
    end
  end
  if p1action == "jumpsquat" or p1action == "land" then
    love.graphics.draw(p1squat, p1x+half-sizex, p1y+asd-sizey)
  end
  if p1action == "jump" then
    if p1yv <= 0 then love.graphics.draw(p1jumprise, p1x+half-sizex, p1y+asd-sizey)
    else love.graphics.draw(p1jumpfall, p1x+half-sizex, p1y+asd-sizey) end
  end

  if p1action == "low" then
    if p1frame < 2 or (p1frame >= (lowlength)-2) then
      love.graphics.draw(p1kick1, p1x+half-sizex, p1y+asd-sizey)
    else
      love.graphics.draw(p1kick2, p1x+half-sizex, p1y+asd-sizey)
    end
  end
  if p1action == "mid" then
    if p1frame < 6 or (p1frame >= (midlength)-2) then
      if p1frame < 5 then
        love.graphics.draw(p1idle, p1x+half-sizex, p1y+asd-sizey)
      else
        love.graphics.draw(p1mid1, p1x+half-sizex, p1y+asd-sizey)
      end
    else
      love.graphics.draw(p1mid2, p1x+half-sizex, p1y+asd-sizey)
    end
  end
  if p1action == "super" then
    if p1frame < 9 or (p1frame >= (superlength)-2) then
      if p1frame < 7 then
        love.graphics.draw(p1super2, p1x+half-sizex, p1y+asd-sizey)
      elseif p1frame < 5 then
        love.graphics.draw(p1super1, p1x+half-sizex, p1y+asd-sizey)
      else
        love.graphics.draw(p1super1, p1x+half-sizex, p1y+asd-sizey)
      end
    else
      love.graphics.draw(p1super3, p1x+half-sizex, p1y+asd-sizey)
    end
  end

  if p1action == "air" then
    love.graphics.draw(p1air, p1x+half-sizex, p1y+asd-sizey)
  end

  if p1action == "shield" then
    if p1invincible then
      love.graphics.draw(p1shield, p1x+half-sizex, p1y+asd-sizey)
    else
      love.graphics.draw(p1stun, p1x+half-sizex, p1y+asd-sizey)
    end
  end
  if p1action == "shieldhit" then
    love.graphics.draw(p1air, p1x+half-sizex, p1y+asd-sizey)
  end

  if p1action == "stun" then
    love.graphics.draw(p1stun, p1x+half-sizex, p1y+asd-sizey)
  end

end
