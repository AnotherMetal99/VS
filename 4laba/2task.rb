module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp
      break if verb == 'q'

      if verb != "GET" and verb != "POST" and verb != "PUT" and verb != "DELETE" and verb != "q" 
        puts "Exception: wrong argument"
      end

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        break if action == 'q'
      end
      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end

class PostsController
  extend Resource
  def initialize
    @posts = []
  end

  def index
    if @posts.empty? 
      puts 'No post found'
    else 
      @posts.each.with_index {|value, key| puts "id: #{key} body: #{value}"}
    end
  end

  def show
    puts 'Enter post id' 
    index = gets.to_i
    if @posts.size > index  && index  >= 0
      puts "Post with id #{index }\n#{@posts[index]}"
    else puts "Error! Post with id:#{index } not found"
    end
  end

  def create
    puts "Enter post body:"
    body = gets
    @posts.push(body)
  end

  def update
    puts 'Enter the post id to update it:'
    index  = gets.to_i
    body = nil
    puts 'Enter post body:'
    body = gets
    @posts[index] = body
    self.index
  end

  def destroy
    puts'Post id'
    index  = gets.to_i
    if @posts.size > index 
      @posts.delete_at(index)
    else puts "This post not exist\n"
    end
  end
end

class CommentsController
  extend Resource
  def initialize
      @comments = {} 
  end

  def index
    if @comments.empty? 
      puts 'Comments not found'
    else
      @comments.each{ |key, value|
        puts "post id: #{key}\n"
        value.each.with_index {|vl, i|
          puts "comment id: #{i} comment: #{vl}"
        }
    }
    end
  end

  def show
    puts 'Post id: '
    idp = gets.to_i
    if @comments.key?(idp)
      @comments[idp].each.with_index{|value, id|puts "comment id: #{id} comment: #{value}"}
    else puts "No comments found"
    end
  end

  def create
    print 'Post id: '
    idp = gets.to_i
    puts "Comment:"
    message = gets
    if @comments.key?(idp)
      @comments[idp].push(message)
    else 
      @comments.store(idp, [message])
    end
    self.index
  end

  def update
    puts 'Post id:'
    idp  = gets.to_i
    puts 'Comment :'
    message = gets
    @comments.store(idp,[message])
  end

  def destroy
    print 'Input post id: '
    idp = gets.to_i
    @comments.delete(idp)
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')
    resources(CommentsController, 'comments')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp

      PostsController.connection(@routes['posts']) if choise == '1'
      CommentsController.connection(@routes['comments']) if choise == '2'
      break if choise == 'q'
    end

    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end


router = Router.new

router.init
