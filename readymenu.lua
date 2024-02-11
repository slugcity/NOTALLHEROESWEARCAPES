function renderMenu()

  if gameState == "menu" then
    love.graphics.setColor(0,0,0, .5)
    love.graphics.rectangle("fill", 0, 0, 896, 504)

    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(logo, half, 125, 0, 1 ,1, 50, 50)
    love.graphics.draw(text, half, 225, 0, 1 ,1, 50, 50)
    love.graphics.draw(credits, half, 335, 0, 1 ,1, 50, 50)
    displayKeys()
    displayReady()
  end

  if gameState == "countdown" then
    if count >= 45*3 then
      gameState = "play"
      bell:stop()
      bell:play()
      start:stop()
      start:play()
    end
    if 0 <= count and count < 45 then
      love.graphics.draw(three, half, 125, 0, 1 ,1, 25, 25)
    elseif 45 <= count and count < (45*2)-1 then
      love.graphics.draw(two, half, 125, 0, 1 ,1, 25, 25)
    else
      love.graphics.draw(one, half, 125, 0, 1 ,1, 25, 25)
    end
    if count == 0 or count == 45 or count == 90 then
      bell:stop()
      bell:play()
    end
  end

  if gameState == "over" then
    if count >= 45*3 then gameState = "menu" p1ready = false p2ready = false end
    if p2health <= 0 then
      love.graphics.draw(p1wins, half, 125, 0, 1 ,1, 50, 50)
    else
      love.graphics.draw(p2wins, half, 125, 0, 1 ,1, 50, 50)
    end
  end

  count = count + 1

end

function displayKeys()
  dx = 75
  dy = 100
  love.graphics.draw(w, 25+dx, dy)
  love.graphics.draw(a, dx, 25+dy)
  love.graphics.draw(s, 25+dx, 25+dy)
  love.graphics.draw(d, 50+dx, 25+dy)

  love.graphics.draw(c, 100+dx, 25+dy)
  love.graphics.draw(v, 125+dx, 25+dy)
  love.graphics.draw(b, 150+dx, 25+dy)

  love.graphics.draw(light, 100+dx, 50+dy)
  love.graphics.draw(heavy, 125+dx, 50+dy)
  love.graphics.draw(block, 150+dx, 50+dy)

  love.graphics.draw(up, 896+(-25-dx)-25, dy)
  love.graphics.draw(down, 896+(-25-dx)-25, dy+25)
  love.graphics.draw(right, 896+(-25-dx), dy+25)
  love.graphics.draw(left, 896+(-50-dx)-25, dy+25)

  love.graphics.draw(slash, 896+(-100-dx)-25, dy+25)
  love.graphics.draw(period, 896+(-125-dx)-25, dy+25)
  love.graphics.draw(comma, 896+(-150-dx)-25, dy+25)

  love.graphics.draw(light, 896+(-100-dx)-25, dy+50)
  love.graphics.draw(heavy, 896+(-125-dx)-25, dy+50)
  love.graphics.draw(block, 896+(-150-dx)-25, dy+50)
end

function displayReady()
  love.graphics.draw(ready, half, 420, 0, 1 ,1, 50, 50)
  rx = 325
  ry = 375
  if p1ready then love.graphics.draw(boxchecked, rx, ry) else love.graphics.draw(box, rx, ry) end
  if p2ready then love.graphics.draw(boxchecked, 896-50-rx, ry) else love.graphics.draw(box, 896-50-rx, ry) end
end

function resetMenu()

  p1ready = false
  p2ready = false
end

function trackReady()
  if gameState == "menu" then
  if p1Hit then p1ready = true end
  if p2Hit then p2ready = true end
  end

  --if both ready
  if p1ready and p2ready and gameState == "menu" then
  count = 0
  gameState = "countdown"
  playerVars()
  end
end
