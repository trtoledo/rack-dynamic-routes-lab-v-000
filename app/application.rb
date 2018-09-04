class Application

  @@items = [Item.new("Sorry", "Justin Bieber"),
            Item.new("Hello","Adele")]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      item_title = req.path.split("/items/").last #turn /songs/Sorry into Sorry
      item = @@items.find{|s| s.title == item_title}

      resp.write item.price
    end

    resp.finish
  end
end
