--input

p1Up = false
p1Down = false
p1Left = false
p1Right = false
p1Hit = false
p1Shield = false
p1Super = false

p2Up = false
p2Down = false
p2Left = false
p2Right = false
p2Hit = false
p2Shield = false
p2Super = false

debugStun = false

function inputAll()
  p1Input()
  p2Input()

  if love.keyboard.isDown("p") then
    if debugStun == false then
      stunp1()
      debugStun = true
    end
  else
    debugStun = false
  end
end

function p1Input()
  if love.keyboard.isDown("w") then
    if p1Up == false then
      p1Up = true
    end
  else
    p1Up = false
  end
  if love.keyboard.isDown("s") then
    if p1Down == false then
      p1Down = true
    end
  else
    p1Down = false
  end
  if love.keyboard.isDown("a") then
    if p1Left == false then
      p1Left = true
    end
  else
    p1Left = false
  end
  if love.keyboard.isDown("d") then
    if p1Right == false then
      p1Right = true
    end
  else
    p1Right = false
  end

  if love.keyboard.isDown("c") then
    if p1Hit == false then
      p1Hit = true
    end
  else
    p1Hit = false
  end
  if love.keyboard.isDown("b") then
    if p1Shield == false then
      p1Shield = true
    end
  else
    p1Shield = false
  end
  if love.keyboard.isDown("v") then
    if p1Super == false then
      p1Super = true
    end
  else
    p1Super = false
  end
end

function p2Input()
  if love.keyboard.isDown("up") then
    if p2Up == false then
      p2Up = true
    end
  else
    p2Up = false
  end
  if love.keyboard.isDown("down") then
    if p2Down == false then
      p2Down = true
    end
  else
    p2Down = false
  end
  if love.keyboard.isDown("left") then
    if p2Left == false then
      p2Left = true
    end
  else
    p2Left = false
  end
  if love.keyboard.isDown("right") then
    if p2Right == false then
      p2Right = true
    end
  else
    p2Right = false
  end

  if love.keyboard.isDown("/") then
    if p2Hit == false then
      p2Hit = true
    end
  else
    p2Hit = false
  end
  if love.keyboard.isDown(",") then
    if p2Shield == false then
      p2Shield = true
    end
  else
    p2Shield = false
  end
  if love.keyboard.isDown(".") then
    if p2Super == false then
      p2Super = true
    end
  else
    p2Super = false
  end
end
