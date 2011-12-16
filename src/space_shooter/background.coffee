# This class is the space background and holds a bunch
# of stars
Background = (I={}) ->
  Object.reverseMerge I,
    color: "transparent"
    displacement: 0
    height: 320
    stars: []
    width: 480
    x: 0
    y: 0

  25.times ->
    I.stars.push Point(rand(I.width), rand(I.height))

  self = GameObject(I)

  self.bind 'update', ->
    I.displacement += 6

  self.bind 'draw', (canvas) ->
    I.stars.each (star) ->
      canvas.drawCircle
        color: "#FFF"
        x: star.x
        y: (star.y + I.displacement).mod(I.height)
        radius: 2

  return self

