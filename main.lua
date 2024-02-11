require ("util")
require ("input")
require ("load")
require ("player")
require("playerone")
require("playertwo")
require("renderone")
require("rendertwo")
require("render")
require ("readymenu")


function love.load()
  gameState = "menu"
  love.window.setMode(1792, 1008, {resizable=true, minwidth=448, minheight=252, highdpi=true})
  love.window.setTitle("nahwc")
  love.graphics.setDefaultFilter("nearest", "nearest", 1)
  gamescreen = love.graphics.newCanvas(896,504)
  love.graphics.setFont(love.graphics.newFont(8))
  love.graphics.setLineStyle("rough")
  math.randomseed(os.time())
  init()
end

function love.update(dt)
  timercycle()
  music()

  -- game here
  inputAll()
  playerPhysics()
  trackReady()

  getScale()
  advance()
end

function love.draw()
  renderAll()
  love.graphics.setCanvas()
  love.graphics.setColor(1,1,1)
  love.graphics.clear(0, 0, 0)
  love.graphics.draw(gamescreen, posx, posy, 0, scale)
  love.graphics.setColor(0,0,0)
end

function music()

  if not m1:isPlaying() then
    love.audio.play(m1)
    love.audio.play(m2)
  end

if gameState == "play" then
  m1:setVolume(1)
  m2:setVolume(0)
else
  m1:setVolume(0)
  m2:setVolume(1)
end

end

function randomChars()
  rrr = math.random(1, 3)
  if rrr == 1 then p1char = "teach"
  elseif rrr == 2 then p1char = "doc"
  else p1char = "fire"
  end

  rrr = math.random(1, 3)
  if rrr == 1 then p2char = "teach"
  elseif rrr == 2 then p2char = "doc"
  else p2char = "fire"
  end

  loadimages()
end
