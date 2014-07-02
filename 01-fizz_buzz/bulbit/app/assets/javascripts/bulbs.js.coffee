# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

## To Do - review it can clean it up
class FireWorks
  canvasId = null
  canvasCntx = null
  canvas = null
  screen =
    height: 0
    width: 0
    groundY: 0

  timer = null

  screenItems =
    static: []
    rockets: []

  ## The range of numbers for the fizz bizz
  START_VALUE = 1
  MAX_VALUE = 100

  constructor: (canvasIdString) ->
    canvasId = canvasIdString

  init: () ->
 
    @currentValue = START_VALUE

    canvas = document.getElementById canvasId   

    if canvas and canvas.getContext
      canvasCntx = canvas.getContext('2d')
      screen.height = $(window).height()
      screen.width = $(window).width()
      canvas.height = screen.height
      canvas.width = screen.width

      screen.groundY = switch
        when screen.height > 250 
          screen.groundY = 50
        else 
          screen.groundY = Math.floor screen.height/10
   
      if window.DeviceOrientationEvent
        $(window).bind('deviceorientation', (event)   ->
          that.orientationChange(event))

      ## Create the basic elements that will be needed
      ## These include the ground and the sky
      ## First the sky
      screenItems.static.push(new FillBox(screen.width, (screen.height - screen.groundY)
        0, 0, "rgb(200, 255, 255)"))

      ## Now the ground
      screenItems.static.push(new FillBox(screen.width, screen.groundY,
        0, (screen.height - screen.groundY), "rgb(0, 200, 0)"))

      ## Launcher
      screenItems.static.push(new FillBox(20, 
        50, (screen.width/2 - 10), (screen.height - screen.groundY - 50), "rgb(102, 51, 0)"))
    
      @startRunning()
      

  startRunning: () ->
    that = this
    @currentValue = START_VALUE
    ## Kick off the first rocket
    @fire()

    timer = setInterval(
      () ->
        that.drawCanvas()
      , 33)

  drawCanvas: () ->
      
    for item in screenItems.static
      item.draw(canvasCntx) 

    ## Draw all of the items. If an item exploded
    ## then add another. If an item has finished
    ## then remove the first item. As all items
    ## transition from sploded to done at the same
    ## rate it is safe to just remove the first item
    ## because that one will be 'finished' before
    ## all others. Maybe better handling in the
    ## future. 
    removeCount = 0
    for item in screenItems.rockets
      switch item.draw(canvasCntx)
        when "sploded" then @fire()
        when "finished" then removeCount++
          
    if removeCount
      screenItems.rockets = screenItems.rockets.slice(removeCount)

      if @currentValue > MAX_VALUE and screenItems.rockets.length is 0
        ## No point in continuing redrawing
        clearInterval(timer)
        that = this
        repeatButton = new Button(canvas.width/2, canvas.height/2, 20, 
          "rgb(0,0,240)",  100, "Again?", canvasId, () ->
            that.startRunning())
        repeatButton.draw(canvasCntx);
        
  fire: () ->
    ## This will launch a Rocket with a ball.  The ball has a message. 
    ## That message is the Fizz Bizz output.  Seriously, that is the output
    ## The Rocket or 'firework' will 'splode' (i the kids are not using
    ## that to mean something else) and dispay the Fizz Bizz message
    if @currentValue <= MAX_VALUE
      ## Now for the Fixx Bizz figure the message
      message = switch 
        when (@currentValue % 3) is 0 and (@currentValue %5) is 0
          "FizzBizz"
        when @currentValue % 3 is 0
          "Fizz"
        when @currentValue % 5 is 0
          "Bizz"
        else @currentValue.toString()

      screenItems.rockets.push(new Rocket(screen.width/2, (screen.height - screen.groundY - 50),
        8, screen.width, "#000000", 10, message))
    
      @currentValue++

  orientationChange: (event) ->
    if window.innerHeight > window.innerWidth
      console.log()

class CanvasItem

  draw: (context) ->
    ## Will be over ridden

class FillBox extends CanvasItem
  
  constructor: (mywidth, myheight, myleftEdge, myTopEdge, myfillColor) ->
    @height = myheight
    @width = mywidth
    @startX = myleftEdge
    @startY = myTopEdge
    @color = myfillColor

  draw: (context) ->
    context.save()
    context.fillStyle = @color
    context.fillRect(@startX, @startY, @width, @height)
    context.restore()

class Rocket extends CanvasItem
  ## These are the colors and number of colors for the splodes
  NUM_SPLODE_COLORS = 5
  SPLODE_COLORS = ["41, 204, 0", "51, 0, 204", "204, 0, 102", "255, 255, 51", "204, 0, 0"]

  ## The increment to use each type a splode is drawn. The splode elements
  ## move further out on the radius by this delta
  SPLODE_POSITION_DELTA = 4

  ## Amount to increase font by each step
  FONT_SIZE_DELTA = 1

  ## The amount by which the splode alpha should be drecemented each time
  ## They will graduallly fade away
  ALPHA_DELTA = .025
        
  constructor: (startX, startY, @radius, @screenWidth, @color, @numSplodes, @msg) ->
    @finished = false

    ## Max height cannot be too near the top of the screen. Need to see the
    ## Splode. It should not be to near the bottom of the screen either
    ## The bounds for are:
    ## Remember these are measured from the top of the screen which is 0
    ## Max height: 15 * radius
    ## Min Height: (15 * radius) + 3/4 of the distance to the starting point

    @maxHeight = 15*@radius + Math.floor(Math.random() * startY * 3/4 )
    ## The radians for a full circle
    @circleRadians = Math.PI * 2
    ## Initial position
    @x = startX
    @y = startY

    @leftEdge = (8*@radius)
    @rightEdge = @screenWidth - (8*@radius)

    ## Visually the 'straight up' point is a 270 degrees so the actuall
    ## range of angles would be bound by an angle that is plus or
    ## minus 50 of this value.  Calculate it and convert to radians
    ## Next we want to convert this angle to radians
    @angle = (220 + Math.floor(Math.random()*100)) * Math.PI/180
    ## Figure the absolute speed. Then use it to calculate the X and
    ## Y speeds
    @speed = 5 +(5 * Math.random()) 
    @xunits = Math.cos(@angle)*@speed
    @yunits = Math.sin(@angle)*@speed

    ## When this deal explodes there will be set of smaller circles
    ## drawn.  These are based on the radius provided
    ## The each of these 'splodes' will occupy a fixed arc within
    ## the initial @radius.  To find this radius divide 360/@numSplodes.
    ## Need half the radius for calculations and then need it in radians
    ## which is (Math*PI/180) so you get the formula below
    @splodeRadius = Math.floor((@radius * Math.tan(Math.PI/@numSplodes)))
    @splodeRadians = 2*Math.PI/@numSplodes 
    @splodePosition = @radius - @splodeRadius
    @splodeColor = SPLODE_COLORS[Math.floor(Math.random()*NUM_SPLODE_COLORS)]
    @splodeAlpha = 1

    @fontSize = @radius
    
  draw: (context) -> 
    context.save()
    if not @exploded
      context.fillStyle = @color
      context.beginPath()
      context.arc(@x, @y, @radius, 0, @circleRadians, true)
      context.closePath()
      context.fill()
    else
      context.translate(@x, @y)
      context.textAlign = "center"
      context.font = "normal normal " + @fontSize + "px sans-serif"
      context.fillStyle = "rgba(" + @splodeColor + ", " + @splodeAlpha + ")"
      context.fillText(@msg, 0, 0)
      context.strokeStyle = "rgba(0, 0, 0, " + @splodeAlpha + ")" 
      context.strokeText(@msg, 0, 0)

      for item in [0..@numSplodes-1]
        
        #context.fillStyle = "rgba(51, 0, 204, 1)"
        context.beginPath()
        context.arc(@splodePosition * Math.cos(@splodeRadians*item), 
          @splodePosition * Math.sin(@splodeRadians*item),
          @splodeRadius,
          0,
          @circleRadians,
          true)
        context.closePath()
        context.fill()

    context.restore()  

    return @update()

  update: () ->
    @x += @xunits
    @y += @yunits

    if @exploded
      @splodePosition += SPLODE_POSITION_DELTA
      @fontSize += FONT_SIZE_DELTA

      if not @finished
        @splodeAlpha -= ALPHA_DELTA

        if @splodeAlpha <= 0
          @finished = true
          @splodeAlpha = 0
          return "finished"

    else if @y <= @maxHeight or @x <= @leftEdge or @x >= @rightEdge
      @exploded = true
      return "sploded"
    
    return ""

class Button extends CanvasItem
  
  CORNER_RADIUS = 5

  constructor: (@centerX, @centerY, @height, @color, @width, @text, @canvasId, @action) ->
    @startX = @centerX - (@width/2)
    @startY = @centerY - (@height/2)
    that = this
    ## Add a click event for this button
    $('#' + @canvasId).bind('click', (event) ->
      that.clickCallback(event))

  draw: (context) ->
    context.save()
    context.beginPath()
    context.translate(@startX, @startY)
    context.fillStyle = @color
    context.beginPath()
    context.moveTo(CORNER_RADIUS, 0)
    ## Starting from upper left corner
    context.lineTo(@width - CORNER_RADIUS,  0)
    context.arc(@width - CORNER_RADIUS, CORNER_RADIUS, CORNER_RADIUS, 1.5*Math.PI, 0)
    context.lineTo(@width, @height - CORNER_RADIUS)
    context.arc(@width - CORNER_RADIUS, @height - CORNER_RADIUS, CORNER_RADIUS, 0, Math.PI/2)
    context.lineTo(CORNER_RADIUS, @height)
    context.arc(CORNER_RADIUS, @height - CORNER_RADIUS, CORNER_RADIUS, Math.PI/2, Math.PI)
    context.lineTo(0, CORNER_RADIUS)
    context.arc(CORNER_RADIUS, CORNER_RADIUS, CORNER_RADIUS, Math.PI, 1.5*Math.PI)
    context.fill()
    context.restore()

    ## Now add the text message
    context.save()
    context.translate(@centerX, @centerY)
    context.textAlign = "center"
    context.textBaseline = "middle"
    context.font = "normal normal 14px sans-serif"
    context.fillStyle = "rgb(255,255,255)"
    context.fillText(@text, 0, 0)
    context.restore()

  clickCallback: (event) -> 
    if event.clientX >= @startX and event.clientX <= @startX + @width and
    event.clientY >= @startY and event.clientY <= @startY + @height
      $('#' + @canvasId).unbind('click')
      @action()     


$(window).bind('load', ()   ->
  console.log('Window load')
  myFireworks = new FireWorks('my_canvas')
  myFireworks.init())


