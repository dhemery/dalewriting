module Jekyll

    module Filters
        def as_list_of_links(categories)
            dir = @context.registers[:site].config['category_dir']
            categories = categories.sort.map do |item|
                name = item[0]
                post_count = item [1].count
                "<li><a class='category' href='/#{dir}/#{name.gsub(/_|\P{Word}/, '-').gsub(/-{2,}/, '-').downcase}/'>#{name} (#{post_count})</a></li>"
            end

            categories
        end
    end

end
