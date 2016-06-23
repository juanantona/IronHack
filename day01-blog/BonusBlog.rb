############################
#CLASS DECALARTION
############################

class Blog
  
  attr_accessor :post
  
  def initialize
  	@post=[]
  end	

  def add_post(post)
    @post.push(post)
  end	

  def sort_by_date
    return @post.sort_by {|post| post.date}.reverse
  end
  
  def title(post)
    if post.sponsored == true
      strTitle = "******" + post.title + "******"
    else      
      strTitle = post.title
    end
    return strTitle
  end  

  def create_front_page
    strAux = ""
    sort_by_date.each do |post|
       strAux = strAux + title(post) + "\n"
       strAux = strAux + "**************" + "\n"
       strAux = strAux + post.text + "\n"
       strAux = strAux + "--------------" + "\n"
    end
    return strAux
  end

  def publish_front_page
    puts create_front_page 
  end

end

class Post

  attr_accessor :title, :text, :date
  
  def initialize(title, date, text, sponsored)
    @title = title
    @date = date
    @text = text
    @sponsored = sponsored
  end

  def title
    @title	
  end

  def date
    @date	
  end

  def text
    @text	
  end

  def sponsored
    @sponsored 
  end

end

############################
#INSTANCES
############################

post1 = Post.new "Title_1", 2010, "z", false
post2 = Post.new "Title_2", 2015, "y", true
post3 = Post.new "Title_3", 1976, "x", false

myBlog = Blog.new  

############################
#MAIN
############################

myBlog.add_post(post1)
myBlog.add_post(post2)
myBlog.add_post(post3)

myBlog.create_front_page
myBlog.publish_front_page
myBlog.sort_by_date

