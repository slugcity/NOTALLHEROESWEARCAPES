

function init()
  timer=0
  count = 0
  playerVars()
  randomChars()
  loadsound()
  resetMenu()
end

function playerVars()
  randomChars()

  p1x = -300
  p1y = 0
  p1xv = 0
  p1yv = 0

  p2x = p1x * -1
  p2y = 0
  p2xv = 0
  p2yv = 0

  p1xa = 0
  p2xa = 0

  p1hp = 0
  p2hp = 0

  p1action = "idle"
  p2action = "idle"

  p1invincible = false
  p2invincible = false

  p1crouching = false
  p2crouching = false

  p1inair = false
  p2inair = false

  p1frame = 0
  p2frame = 0

  lowx = 95
  lowy = 0

  midx = 70
  midy = 100

  airx = 95
  airy = 33

  superx = 90
  supery = 120

  p1active = false
  p2active = false

  p1health = 8
  p2health = 8

end

function loadimages()
  --teach, doc, fire, base
  timerframe = 1
  p2char = p2char.."rev"

  p1idle = love.graphics.newImage("/assets/"..p1char.."/idle"..timerframe..".png")
  p1squat = love.graphics.newImage("/assets/"..p1char.."/squat"..timerframe..".png")

  p1crouch = love.graphics.newImage("/assets/"..p1char.."/crouch"..timerframe..".png")
  p1kick1 = love.graphics.newImage("/assets/"..p1char.."/kick1"..timerframe..".png")
  p1kick2 = love.graphics.newImage("/assets/"..p1char.."/kick2"..timerframe..".png")
  p1air = love.graphics.newImage("/assets/"..p1char.."/air"..timerframe..".png")
  p1mid1 = love.graphics.newImage("/assets/"..p1char.."/mid1"..timerframe..".png")
  p1mid2 = love.graphics.newImage("/assets/"..p1char.."/mid2"..timerframe..".png")
  p1super1 = love.graphics.newImage("/assets/"..p1char.."/super1"..timerframe..".png")
  p1super2 = love.graphics.newImage("/assets/"..p1char.."/super2"..timerframe..".png")
  p1super3 = love.graphics.newImage("/assets/"..p1char.."/super3"..timerframe..".png")

  p1jumprise = love.graphics.newImage("/assets/"..p1char.."/jumprise"..timerframe..".png")
  p1jumpfall = love.graphics.newImage("/assets/"..p1char.."/jumpfall"..timerframe..".png")

  p1shield = love.graphics.newImage("/assets/"..p1char.."/shield"..timerframe..".png")

  p1walk = love.graphics.newImage("/assets/"..p1char.."/walk"..timerframe..".png")

  p1stun = love.graphics.newImage("/assets/"..p1char.."/stun"..timerframe..".png")

  --HFJUIOEWLHJFLUIOE
  p2idle = love.graphics.newImage("/assets/"..p2char.."/idle"..timerframe..".png")
  p2squat = love.graphics.newImage("/assets/"..p2char.."/squat"..timerframe..".png")

  p2crouch = love.graphics.newImage("/assets/"..p2char.."/crouch"..timerframe..".png")
  p2kick1 = love.graphics.newImage("/assets/"..p2char.."/kick1"..timerframe..".png")
  p2kick2 = love.graphics.newImage("/assets/"..p2char.."/kick2"..timerframe..".png")
  p2air = love.graphics.newImage("/assets/"..p2char.."/air"..timerframe..".png")
  p2mid1 = love.graphics.newImage("/assets/"..p2char.."/mid1"..timerframe..".png")
  p2mid2 = love.graphics.newImage("/assets/"..p2char.."/mid2"..timerframe..".png")
  p2super1 = love.graphics.newImage("/assets/"..p2char.."/super1"..timerframe..".png")
  p2super2 = love.graphics.newImage("/assets/"..p2char.."/super2"..timerframe..".png")
  p2super3 = love.graphics.newImage("/assets/"..p2char.."/super3"..timerframe..".png")

  p2jumprise = love.graphics.newImage("/assets/"..p2char.."/jumprise"..timerframe..".png")
  p2jumpfall = love.graphics.newImage("/assets/"..p2char.."/jumpfall"..timerframe..".png")

  p2shield = love.graphics.newImage("/assets/"..p2char.."/shield"..timerframe..".png")

  p2walk = love.graphics.newImage("/assets/"..p2char.."/walk"..timerframe..".png")

  p2stun = love.graphics.newImage("/assets/"..p2char.."/stun"..timerframe..".png")

  --ui
  full = love.graphics.newImage("/assets/full.png")
  halfheart = love.graphics.newImage("/assets/half.png")

  logo = love.graphics.newImage("/assets/logo.png")
  text = love.graphics.newImage("/assets/text.png")
  credits = love.graphics.newImage("/assets/credits.png")

  w = love.graphics.newImage("/assets/keys/w.png")
  a = love.graphics.newImage("/assets/keys/a.png")
  s = love.graphics.newImage("/assets/keys/s.png")
  d = love.graphics.newImage("/assets/keys/d.png")
  c = love.graphics.newImage("/assets/keys/c.png")
  v = love.graphics.newImage("/assets/keys/v.png")
  b = love.graphics.newImage("/assets/keys/b.png")

  up = love.graphics.newImage("/assets/keys/up.png")
  down = love.graphics.newImage("/assets/keys/down.png")
  left = love.graphics.newImage("/assets/keys/left.png")
  right = love.graphics.newImage("/assets/keys/right.png")
  slash = love.graphics.newImage("/assets/keys/slash.png")
  period = love.graphics.newImage("/assets/keys/period.png")
  comma = love.graphics.newImage("/assets/keys/comma.png")

  light = love.graphics.newImage("/assets/keys/light.png")
  heavy = love.graphics.newImage("/assets/keys/heavy.png")
  block = love.graphics.newImage("/assets/keys/block.png")

  ready = love.graphics.newImage("/assets/ready.png")
  box = love.graphics.newImage("/assets/box.png")
  boxchecked = love.graphics.newImage("/assets/boxchecked.png")

  three = love.graphics.newImage("/assets/3.png")
  two = love.graphics.newImage("/assets/2.png")
  one = love.graphics.newImage("/assets/1.png")

  p1wins = love.graphics.newImage("/assets/p1wins.png")
  p2wins = love.graphics.newImage("/assets/p2wins.png")
end

function loadsound()
  kick = love.audio.newSource("/assets/sfx/kick.wav", "static")
  snare = love.audio.newSource("/assets/sfx/snare.wav", "static")
  smallhit = love.audio.newSource("/assets/sfx/smallhit.wav", "static")
  midhit = love.audio.newSource("/assets/sfx/midhit.wav", "static")
  bighit = love.audio.newSource("/assets/sfx/bighit.wav", "static")
  shield = love.audio.newSource("/assets/sfx/shield.wav", "static")

  bell = love.audio.newSource("/assets/sfx/bell.wav", "static")
  start = love.audio.newSource("/assets/sfx/start.wav", "static")
  fin = love.audio.newSource("/assets/sfx/fin.wav", "static")

  m1 = love.audio.newSource("/assets/music/rege.wav", "static")
  m2 = love.audio.newSource("/assets/music/nodrums.wav", "static")
end
