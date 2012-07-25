module PostsHelper
  def post_title_with_reply_count( post )
    if post && post.title
      comments = post.comment_threads
      count = comments.length
      if count > 0
        return post.title + " [" + count.to_s() + "]"
      else
        return post.title
      end
    end
    ""
  end
end
