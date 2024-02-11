function renderAll()
  love.graphics.setCanvas(gamescreen)
  love.graphics.clear(.2, .2, .2, 1)
  love.graphics.setColor(1,1,1)

  p2Render()
  p1Render()
  love.graphics.setColor(1,1,1)

  --playerHitboxes()

  --playerStats()

  if gameState == "play" then renderHealth() end
  --love.graphics.print(gameState..count, 0, 0)

  renderMenu()
  love.graphics.setColor(1,1,1)
end

function playerHitboxes()
  love.graphics.line(p1x+half, p1y+asd, p1x+half, p1y-sizey+asd)
  love.graphics.setColor(0,1,0)
  love.graphics.rectangle("line", p1x+half-sizex, p1y+asd, 2*sizex, -sizey)

  --love.graphics.circle("fill", 0+half, -200+asd, 2)

  love.graphics.setColor(.6,0,0)
  love.graphics.circle("fill", p1x+lowx+half, p1y+asd, 2)

  love.graphics.circle("fill", p1x+midx+half, p1y-midy+asd, 2)

  love.graphics.circle("fill", p1x+airx+half, p1y-airy+asd, 2)

  love.graphics.circle("fill", p1x+superx+half, p1y-supery+asd, 2)


  love.graphics.line(p2x+half, p2y+asd, p2x+half, p2y-sizey+asd)
  love.graphics.setColor(0,1,0)
  love.graphics.rectangle("line", p2x+half-sizex, p2y+asd, 2*sizex, -sizey)

  --love.graphics.circle("fill", 0+half, -200+asd, 2)

  love.graphics.setColor(.6,0,0)
  love.graphics.circle("fill", p2x-lowx+half, p2y+asd, 2)

  love.graphics.circle("fill", p2x-midx+half, p2y-midy+asd, 2)

  love.graphics.circle("fill", p2x-airx+half, p2y-airy+asd, 2)

  love.graphics.circle("fill", p2x-superx+half, p2y-supery+asd, 2)
end

function playerStats()
  love.graphics.setColor(1,1,1)
  love.graphics.print(p1action.."\n"..
                      tostring(p1active).."\n"..
                      tostring(p1inair).."\n"..
                      tostring(p1invincible).."\n"..
                      tostring(p1crouching).."\n"..
                      p1frame, p1x+half+sizex, p1y+asd-sizey)
  love.graphics.print(timer, 0, 0)
end

function renderHealth()
  healthx = 50
  healthy = 420
  --p1
  if p1health > 0 then
  if math.floor(p1health) == p1health then
    for i = 1, p1health do
      --health
      love.graphics.draw(full, 25*(i-1)+healthx, healthy, 0, .5, .5)
    end
  else
    for i = 1, math.floor(p1health) do
      --health
      love.graphics.draw(full, 25*(i-1)+healthx, healthy, 0, .5, .5)
    end
    love.graphics.draw(halfheart, 25*(math.floor(p1health))+healthx, healthy, 0, .5, .5)
  end
  end

  --p2
  if p2health > 0 then
  if math.floor(p2health) == p2health then
    for i = 1, p2health do
      --health
      love.graphics.draw(full, -25*(i)-healthx+896+25, healthy, 0, -.5, .5)
    end
  else
    for i = 1, math.floor(p2health) do
      --health
      love.graphics.draw(full, -25*(i)-healthx+896+25, healthy, 0, -.5, .5)
    end
    love.graphics.draw(halfheart, -25*(math.floor(p2health)+1)-healthx+896+25, healthy, 0, -.5, .5)
  end
  end
end
