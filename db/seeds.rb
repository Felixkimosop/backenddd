# # Clear the database
# puts "Clearing database..."
# Category.destroy_all
# Comment.destroy_all
# Content.destroy_all
# Subscription.destroy_all
# User.destroy_all
# Wishlist.destroy_all

# # Seed the database
# puts "Seeding database..."

# # Categories
# Category.create(name: "Technology")
# Category.create(name: "Sports")
# Category.create(name: "Music")

# # Users
# User.create(name: "John Doe", email: "john@example.com", password: "password", role: "user")
# User.create(name: "Jane Doe", email: "jane@example.com", password: "password", role: "user")
# User.create(name: "Admin", email: "admin@example.com", password: "password", role: "admin")

# # Contents
# Content.create(title: "Introduction to Ruby", description: "Learn the basics of Ruby programming language", content_type: "video", url: "https://www.youtube.com/watch?v=t_ispmWmdjY", thumbnail: "https://i.ytimg.com/vi/t_ispmWmdjY/maxresdefault.jpg", category_id: 1, user_id: 1)
# Content.create(title: "UEFA Champions League Final Highlights", description: "Watch the highlights of the UEFA Champions League Final", content_type: "video", url: "https://www.youtube.com/watch?v=ryheRcYtYrI", thumbnail: "https://i.ytimg.com/vi/ryheRcYtYrI/maxresdefault.jpg", category_id: 2, user_id: 2)
# Content.create(title: "Album Review: After Hours by The Weeknd", description: "Review of The Weeknd's latest album", content_type: "article", url: "https://www.billboard.com/articles/news/9333543/the-weeknd-after-hours-album-review", thumbnail: "https://www.billboard.com/files/styles/1548_xl/public/media/the-weeknd-after-hours-2020-billboard-1548.jpg", category_id: 3, user_id: 3)

# # Subscriptions
# Subscription.create(category_id: 1, user_id: 1)
# Subscription.create(category_id: 2, user_id: 2)
# Subscription.create(category_id: 3, user_id: 1)

# # Wishlists
# Wishlist.create(content_id: 1, user_id: 1)
# Wishlist.create(content_id: 2, user_id: 2)
# Wishlist.create(content_id: 3, user_id: 1)

# # Comments
# Comment.create(content_id: 1, user_id: 1, comment: "Great tutorial!", parent_id: 0)
# Comment.create(content_id: 2, user_id: 2, comment: "What a game!", parent_id: 0)
# Comment.create(content_id: 3, user_id: 3, comment: "Love this album", parent_id: 0)
# Comment.create(content_id: 1, user_id: 2, comment: "Thanks for sharing", parent_id: 1)
# Comment.create(content_id: 2, user_id: 1, comment: "One of the best finals ever!", parent_id: 2)
# Comment.create(content_id: 3, user_id: 2, comment: "Couldn't agree more", parent_id: 3)


# create some users and contents
user1 = User.create(name: "felix", email: "adfrn@example.com", password: "password", role: "admin")
user2 = User.create(name: "Jafe mdoe", email: "jafrne@example.com", password: "password", role: "user")
content1 = Content.create(title: "Introduction to Ruby", description: "Learn the basics of Ruby programming language", content_type: "video", url: "https://www.youtube.com/watch?v=t_ispmWmdjY", thumbnail: "https://i.ytimg.com/vi/t_ispmWmdjY/maxresdefault.jpg", category_id: 1, user_id: 1)

# create some comments
comment1 = Comment.create(content: content1, user: user1, comment: "Nice post!")
comment2 = Comment.create(content: content1, user: user2, comment: "Thanks for sharing!")
comment3 = Comment.create(content: content1, user: user1, comment: "Glad you enjoyed it!")

# create parent-child relationships
comment2.update(parent: comment1)
comment3.update(parent: comment1)
comment4 = Comment.create(content: content1, user: user2, comment: "What about this?")
comment5 = Comment.create(content: content1, user: user1, comment: "I don't agree.")
comment6 = Comment.create(content: content1, user: user2, comment: "Why not?")
comment5.update(parent: comment4)
comment6.update(parent: comment4)

