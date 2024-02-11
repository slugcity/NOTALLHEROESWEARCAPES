function getScale()
  --gets scale for drawing gamescreen
  screenwidth = love.graphics.getWidth()
  screenheight = love.graphics.getHeight()
  if 9*screenwidth>screenheight*16 then
    scale=screenheight/504
    posx=(screenwidth-(896*scale))/2
    posy=0
  else
    scale=screenwidth/896
    posx=0
    posy=(screenheight-(504*scale))/2
  end
  half = 896/2
  asd = (369)
end

function timercycle()
  --1 to 59
  if (timer < 60) then
    timer = timer + 1
  else
    timer = 0
  end
end

function isIn(player, x, y)
  if player == 1 then
    if (p1y >= y) and (y >= p1y - sizey) and (p1x + sizex >= x) and (x >= p1x - sizex)
    then return true end
  else
    if (p2y >= y) and (y >= p2y - sizey) and (p2x + sizex >= x) and (x >= p2x - sizex)
    then return true end
  end
    return false
end

function advance()
  p1frame = p1frame+1
  p2frame = p2frame+1
end
