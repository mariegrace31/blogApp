# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Moha', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Yemen.',
                         posts_count: 0)
second_user = User.create(name: 'Adeeb', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher from Saudi.', posts_count: 0)

first_post = Post.create(author: first_user, title: 'Hello', content: 'This is my first post', likes_count: 0,
                         commentsCounter: 0)
second_post = Post.create(author: first_user, title: 'Hi', content: 'This is my second post', likes_count: 0,
                          commentsCounter: 0)
third_post = Post.create(author: second_user, title: 'Me', content: 'This is my third post', likes_count: 0,
                         commentsCounter: 0)
fourth_post = Post.create(author: second_user, title: 'Yo!', content: 'This is my fourth post', likes_count: 0,
                          commentsCounter: 0)

Comment.create(post: first_post, user: first_user, text: 'Hi Moha!')
Comment.create(post: second_post, user: first_user, text: 'how are you!')
Comment.create(post: third_post, user: first_user, text: 'I like your post!')
Comment.create(post: fourth_post, user: second_user, text: 'It is such a nice post!')
Comment.create(post: third_post, user: second_user, text: 'I am really inspired!')
Comment.create(post: fourth_post, user: second_user, text: 'Bye!')
Comment.create(post: fourth_post, user: first_user, text: 'Yo!')
