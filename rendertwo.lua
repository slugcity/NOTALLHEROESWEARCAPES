function p2Render()

if p2action == "low" or p2action == "mid" or p2action == "air" then
  love.graphics.setColor(.92,.87,.60)
elseif p2action == "super" then
  love.graphics.setColor(.92,.73,.73)
elseif p2invincible then
  love.graphics.setColor(.7,.85,.92)
else
  love.graphics.setColor(1,1,1)
end

  if p2action == "idle" then
    if not p2crouching then
      if p2xa ~= 0 then
        if (0<=timer and timer <= 9) or (20<=timer and timer <= 29) or (40<=timer and timer <= 49) then
          love.graphics.draw(p2idle, p2x+half+sizex, p2y+asd-sizey, 0, -1, 1)
        else
          love.graphics.draw(p2walk, p2x+half+sizex, p2y+asd-sizey, 0, -1, 1)
        end
      else
        love.graphics.draw(p2idle, p2x+half+sizex, p2y+asd-sizey, 0, -1, 1)
      end
    else
      love.graphics.draw(p2crouch, p2x+half+sizex, p2y+asd-sizey, 0, -1, 1)
    end
  end
  if p2action == "jumpsquat" or p2action == "land" then
    love.graphics.draw(p2squat, p2x+half+sizex, p2y+asd-sizey, 0, -1, 1)
  end
  if p2action == "jump" then
    if p2yv <= 0 then love.graphics.draw(p2jumprise, p2x+half+sizex, p2y+asd-sizey, 0, -1, 1)
    else love.graphics.draw(p2jumpfall, p2x+half+sizex, p2y+asd-sizey, 0, -1, 1) end
  end

  if p2action == "low" then
    if p2frame < 2 or (p2frame >= (lowlength)-2) then
      love.graphics.draw(p2kick1, p2x+half+sizex, p2y+asd-sizey, 0, -1, 1)
    else
      love.graphics.draw(p2kick2, p2x+half+sizex, p2y+asd-sizey, 0, -1, 1)
    end
  end
  if p2action == "mid" then
    if p2frame < 6 or (p2frame >= (midlength)-2) then
      if p2frame < 5 then
        love.graphics.draw(p2idle, p2x+half+sizex, p2y+asd-sizey, 0, -1, 1)
      else
        love.graphics.draw(p2mid1, p2x+half+sizex, p2y+asd-sizey, 0, -1, 1)
      end
    else
      love.graphics.draw(p2mid2, p2x+half+sizex, p2y+asd-sizey, 0, -1, 1)
    end
  end
  if p2action == "super" then
    if p2frame < 9 or (p2frame >= (superlength)-2) then
      if p2frame < 7 then
        love.graphics.draw(p2super2, p2x+half+sizex, p2y+asd-sizey, 0, -1, 1)
      elseif p2frame < 5 then
        love.graphics.draw(p2super1, p2x+half+sizex, p2y+asd-sizey, 0, -1, 1)
      else
        love.graphics.draw(p2super1, p2x+half+sizex, p2y+asd-sizey, 0, -1, 1)
      end
    else
      love.graphics.draw(p2super3, p2x+half+sizex, p2y+asd-sizey, 0, -1, 1)
    end
  end

  if p2action == "air" then
    love.graphics.draw(p2air, p2x+half+sizex, p2y+asd-sizey, 0, -1, 1)
  end

  if p2action == "shield" then
    if p2invincible then
      love.graphics.draw(p2shield, p2x+half+sizex, p2y+asd-sizey, 0, -1, 1)
    else
      love.graphics.draw(p2stun, p2x+half+sizex, p2y+asd-sizey, 0, -1, 1)
    end
  end
  if p2action == "shieldhit" then
    love.graphics.draw(p2air, p2x+half+sizex, p2y+asd-sizey, 0, -1, 1)
  end

  if p2action == "stun" then
    love.graphics.draw(p2stun, p2x+half+sizex, p2y+asd-sizey, 0, -1, 1)
  end

end
