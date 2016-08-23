module HomeHelper
  
  def display_likes(product)
    votes = product.votes_for.up.by_type(User)
    return count_likers(votes)
    
  end

  def liked_product(product)  
    return 'glyphicon-heart' if current_user.voted_for? product
    'glyphicon-heart-empty'
  
  end
  
  def unliked_product(product)  
    return 'glyphicon-heart-empty' unless current_user.voted_for? product
    'glyphicon-heart'
  end
  

  def count_likers(votes)
    vote_count = votes.size
    vote_count.to_s
  end



end
