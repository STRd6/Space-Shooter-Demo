window.engine = Engine
  backgroundColor: "#000"
  canvas: $("canvas").pixieCanvas()

engine.add
  class: "Background"

# Set up the initial game state
engine.add
  class: "Player"

engine.bind 'update', ->
  if rand() < 0.1
    engine.add
      class: "Enemy"

engine.start()

