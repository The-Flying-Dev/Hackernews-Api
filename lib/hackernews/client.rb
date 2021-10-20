#The client makes it easier for controllers to interact with the API
module Hackernews  
    class Client
        def initialize
          @host = ''
          @key = ''
        end

        def item(id)
            get("item/#{id}") #interpolating the id into the URI
        end

        def topstories(start = 0, per_page = 5, expand = true)
            stories = get('topstories')[start...start + per_page]

            if expand
                stories.map! do |story|
                    item(story)
                end
            end
            stories
        end

        private

        #requesting path and coverts it to json

        def get(path)
            response = Excon.get(
                'https://' + @host + '/' + path + '.json?print=pretty',
                headers: {
                    'x-rapidapi-host' => @host,
                    'x-rapidapi-key' => @key,
                }
            )

            return false if response.status != 200

            JSON.parse(response.body)
        end
    end
end
