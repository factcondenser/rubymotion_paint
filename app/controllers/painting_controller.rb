class PaintingController < UIViewController
  extend IB

  COLORS = {
    black: '#000000'.uicolor,
    red: '#ff0000'.uicolor,
    yellow: '#ffff00'.uicolor,
    green: '#00ff00'.uicolor,
    blue: '#0000ff'.uicolor,
    brown: '#a52a2a'.uicolor
  }.freeze

  ##########
  # OUTLETS
  ##########

  COLORS.keys.each do |color|
    outlet "#{color}_button"
  end

  outlet :painting_view

  ##############
  # END OUTLETS
  ##############

  attr_reader :painting

  def viewDidLoad
    @painting = Painting.new
    painting_view.painting = painting
  end

  def select_color(sender)
    color_buttons.each do |button|
      button.selected = false
    end

    sender.selected = true
    @color = color_buttons[sender.tag]
  end

  def selected_color
    COLORS.values[color_buttons.index { |button| button.state == UIControlStateSelected }]
  end

  def stroke_gesture_changed(stroke_gesture_recognizer)
    if stroke_gesture_recognizer.state == UIGestureRecognizerStateBegan
      painting.start_stroke(stroke_gesture_recognizer.position, selected_color)
    else
      painting.continue_stroke(stroke_gesture_recognizer.position)
    end

    painting_view.setNeedsDisplay
  end

  private

  def color_buttons
    COLORS.keys.map { |color| send("#{color}_button") }
  end
end
