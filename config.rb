activate :blog do |blog|
    blog.sources = "posts/:year-:month-:day-:title"
    blog.default_extension = ".md"

    blog.layout = "post"
    blog.permalink = ":year/:month/:title"

    blog.tag_template = "categories.html"
    blog.taglink = "category/:tag/index.html"

    blog.paginate = false
end

page "/feed.xml", layout: false

activate :directory_indexes

configure :build do
end
