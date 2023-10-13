require 'gosu'

class SnakeGame < Gosu::Window
  WIDTH = 640
  HEIGHT = 480
  CELL_SIZE = 20

  def initialize
    super(WIDTH, HEIGHT)
    self.caption = "Snake Game"
    @snake = Snake.new
    @food = Food.new
  end

  def update
    @snake.move
    @snake.eat(@food) if @snake.eating?(@food)
    @snake.check_collision
  end

  def draw
    @snake.draw
    @food.draw
  end

  def button_down(id)
    case id
    when Gosu::KB_UP
      @snake.change_direction(:up)
    when Gosu::KB_DOWN
      @snake.change_direction(:down)
    when Gosu::KB_LEFT
      @snake.change_direction(:left)
    when Gosu::KB_RIGHT
      @snake.change_direction(:right)
    when Gosu::KB_ESCAPE
      close
    end
  end
end

class Snake
  def initialize
    @body = [[3, 3], [3, 4], [3, 5]]
    @direction = :right
  end

  def move
    new_head = next_head
    @body.unshift(new_head)
    @body.pop
  end

  def next_head
    current_head = @body.first
    case @direction
    when :up
      [current_head[0], current_head[1] - 1]
    when :down
      [current_head[0], current_head[1] + 1]
    when :left
      [current_head[0] - 1, current_head[1]]
    when :right
      [current_head[0] + 1, current_head[1]]
    end
  end

  def change_direction(new_direction)
    opposite_direction = { up: :down, down: :up, left: :right, right: :left }
    @direction = new_direction unless new_direction == opposite_direction[@direction]
  end

  def eating?(food)
    @body.first == food.position
  end

  def check_collision
    if @body[0] == @body[1..-1]
      puts "Game over!"
      exit
    end
  end

  def draw
    @body.each do |segment|
      Gosu.draw_rect(
        segment[0] * SnakeGame::CELL_SIZE,
        segment[1] * SnakeGame::CELL_SIZE,
        SnakeGame::CELL_SIZE, SnakeGame::CELL_SIZE,
        Gosu::Color::GREEN
      )
    end
  end
end

class Food
  attr_reader :position

  def initialize
    @position = [rand(SnakeGame::WIDTH / SnakeGame::CELL_SIZE), rand(SnakeGame::HEIGHT / SnakeGame::CELL_SIZE)]
  end

  def draw
    Gosu.draw_rect(
      @position[0] * SnakeGame::CELL_SIZE,
      @position[1] * SnakeGame::CELL_SIZE,
      SnakeGame::CELL_SIZE, SnakeGame::CELL_SIZE,
      Gosu::Color::RED
    )
  end
end

SnakeGame.new.show
